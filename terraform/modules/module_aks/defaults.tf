locals {

  additional_node_pools = defaults(var.additional_node_pools, {
    node_count             = 3
    vm_size                = "Standard_DS2_v2"
    auto_scaling           = true
    node_min_count         = 1
    node_max_count         = 3
    max_pods               = 110
    os_disk_size_gb        = 128
    enable_host_encryption = false
    enable_node_public_ip  = false
    os_type                = "Linux"
  })

  aks_cluster = defaults(var.aks_cluster, {
    admin_username  = "byadmin"
    node_count      = 3
    vm_size         = "Standard_DS2_v2"
    auto_scaling    = true
    node_min_count  = 1
    node_max_count  = 3
    max_pods        = 110
    k8s_version     = "1.21.2"
    os_disk_size_gb = 128
  })

  aks_network = defaults(var.aks_network, {
    network_plugin     = "kubenet"
    network_policy     = "calico"
    service_cidr       = "10.0.0.0/16"
    dns_service_ip     = "10.0.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
    load_balancer_sku  = "Standard"
  })

  aks_storage = defaults(var.aks_storage, {
    enabled                          = true
    disable_public_access            = false
    storage_account_tier             = "Standard"
    storage_account_replication_type = "LRS"
    storage_account_kind             = "StorageV2"
  })

}