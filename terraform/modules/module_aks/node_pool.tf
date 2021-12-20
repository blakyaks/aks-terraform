resource "azurerm_kubernetes_cluster_node_pool" "aks" {

  lifecycle {
    ignore_changes = [
      node_count,
    ]
  }

  # Multiple node pools are only supported with Standard SKU load balancer
  for_each = lower(local.aks_network.load_balancer_sku) == "standard" ? local.additional_node_pools : {}

  availability_zones    = var.availability_zones
  enable_auto_scaling   = each.value.auto_scaling
  enable_node_public_ip = each.value.enable_node_public_ip
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  max_count             = each.value.auto_scaling ? each.value.node_max_count : null
  max_pods              = each.value.max_pods
  min_count             = each.value.auto_scaling ? each.value.node_min_count : null
  name                  = substr(each.key, 0, 12)
  node_count            = each.value.node_count
  node_labels           = each.value.labels
  node_taints           = each.value.taints
  os_disk_size_gb       = each.value.os_disk_size_gb
  os_type               = each.value.os_type
  tags                  = var.tags
  vm_size               = each.value.vm_size
  vnet_subnet_id        = var.subnet_id

}
