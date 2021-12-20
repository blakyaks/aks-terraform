locals {
  id = random_string.id.result
  resource_names = {
    resource_group_aks         = format("rg-%s-%s-aks", var.environment, local.id)
    resource_group_net         = format("rg-%s-%s-aks-net", var.environment, local.id)
    virtual_network            = format("vnet-%s-%s-aks", var.environment, local.id)
    azurerm_kubernetes_cluster = format("%s-%s-aks", var.environment, local.id)
    azurerm_storage_account    = format("sa%s%saks", var.environment, local.id)
    azurerm_public_ip          = format("pip-%s-%s-aks", var.environment, local.id)
  }
}

resource "random_string" "id" {
  length  = 5
  special = false
  lower   = true
  upper   = false
}
