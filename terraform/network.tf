resource "azurerm_virtual_network" "aks" {
  name                = local.resource_names.virtual_network
  location            = var.location
  resource_group_name = azurerm_resource_group.net.name
  address_space       = var.network.vnet_address_space
  tags                = var.tags
}

resource "azurerm_subnet" "main" {
  name                                           = "subnet-aks-master"
  resource_group_name                            = azurerm_resource_group.net.name
  virtual_network_name                           = azurerm_virtual_network.aks.name
  address_prefixes                               = [cidrsubnet(azurerm_virtual_network.aks.address_space[0], var.network.master_subnet_cidr[0], var.network.master_subnet_cidr[1])]
  service_endpoints                              = ["Microsoft.ContainerRegistry"]
  enforce_private_link_service_network_policies  = true
  enforce_private_link_endpoint_network_policies = true
}
