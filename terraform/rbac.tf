## So that AKS can provision public LB
resource "azurerm_role_assignment" "kub_to_network" {
  count                = var.grant_load_balancer_rbac ? 1 : 0
  scope                = azurerm_resource_group.net.id
  role_definition_name = "Network Contributor"
  principal_id         = module.aks.cluster.identity[0].principal_id
}
## So that AKS can provision public LB
resource "azurerm_role_assignment" "kub_to_aks" {
  count                = var.grant_load_balancer_rbac ? 1 : 0
  scope                = azurerm_resource_group.aks.id
  role_definition_name = "Network Contributor"
  principal_id         = module.aks.cluster.identity[0].principal_id
}
