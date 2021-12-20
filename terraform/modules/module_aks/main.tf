resource "azurerm_storage_account" "this" {
  count                    = local.aks_storage.enabled ? 1 : 0
  name                     = var.names.azurerm_storage_account
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = local.aks_storage.storage_account_tier
  account_replication_type = local.aks_storage.storage_account_replication_type
  account_kind             = local.aks_storage.storage_account_kind

  tags = var.tags
}

resource "azurerm_public_ip" "this" {
  count               = lower(local.aks_network.load_balancer_sku) == "standard" ? 1 : 0
  name                = var.names.azurerm_public_ip
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  ip_version          = "IPv4"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_kubernetes_cluster" "this" {

  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count,
      kubernetes_version
    ]
  }

  name                = var.names.azurerm_kubernetes_cluster
  resource_group_name = var.resource_group_name
  node_resource_group = format("%s-nodes", var.resource_group_name)
  location            = var.location
  dns_prefix          = var.names.azurerm_kubernetes_cluster
  kubernetes_version  = local.aks_cluster.k8s_version

  linux_profile {
    admin_username = local.aks_cluster.admin_username
    ssh_key {
      key_data = var.tls_key.public_key_openssh
    }
  }

  default_node_pool {
    name                = "main"
    vm_size             = local.aks_cluster.vm_size
    vnet_subnet_id      = var.subnet_id
    enable_auto_scaling = local.aks_cluster.auto_scaling
    node_count          = local.aks_cluster.node_count
    min_count           = local.aks_cluster.auto_scaling ? local.aks_cluster.node_min_count : null
    max_count           = local.aks_cluster.auto_scaling ? local.aks_cluster.node_max_count : null
    max_pods            = local.aks_cluster.max_pods
    os_disk_size_gb     = local.aks_cluster.os_disk_size_gb
    availability_zones  = lower(local.aks_network.load_balancer_sku) == "standard" ? var.availability_zones : []
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = local.aks_network.network_plugin
    network_policy     = local.aks_network.network_policy
    pod_cidr           = local.aks_network.pod_cidr
    service_cidr       = local.aks_network.service_cidr
    dns_service_ip     = local.aks_network.dns_service_ip
    docker_bridge_cidr = local.aks_network.docker_bridge_cidr
    outbound_type      = "loadBalancer"
    load_balancer_sku  = local.aks_network.load_balancer_sku

    dynamic "load_balancer_profile" {
      for_each = lower(local.aks_network.load_balancer_sku) == "standard" ? [1] : []
      content {
        outbound_ip_address_ids = [azurerm_public_ip.this[0].id]
      }
    }
  }

  tags = var.tags
}