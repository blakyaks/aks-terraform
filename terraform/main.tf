resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

module "aks" {
  source = "./modules/module_aks"

  location              = lower(replace(var.location, " ", ""))
  availability_zones    = [1, 2, 3]
  resource_group_name   = azurerm_resource_group.aks.name
  additional_node_pools = {}
  aks_network = {
    network_plugin     = "kubenet"
    network_policy     = "calico"
    service_cidr       = "10.0.0.0/16"
    dns_service_ip     = "10.0.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
    load_balancer_sku  = "Standard"
  }
  aks_storage = {
    enabled                          = true
    disable_public_access            = false
    storage_account_tier             = "Standard"
    storage_account_replication_type = "LRS"
    storage_account_kind             = "StorageV2"
  }
  aks_cluster = {
    admin_username  = "demo_admin"
    node_count      = 3
    vm_size         = "Standard_DS2_v2"
    auto_scaling    = true
    node_min_count  = 1
    node_max_count  = 3
    max_pods        = 110
    k8s_version     = "1.21.2"
    os_disk_size_gb = 128
  }

  names     = local.resource_names
  subnet_id = azurerm_subnet.main.id
  tls_key   = tls_private_key.ssh

  tags = var.tags

}
