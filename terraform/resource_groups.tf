resource "azurerm_resource_group" "aks" {
  name     = local.resource_names.resource_group_aks
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "net" {
  name     = local.resource_names.resource_group_net
  location = var.location
}
