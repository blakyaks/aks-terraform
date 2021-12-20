output "cluster" {
  description = "Cluster object"
  value       = azurerm_kubernetes_cluster.this
}

output "dns_zone_name" {
  description = "Private DNS zone name"
  value       = join(".", slice(split(".", azurerm_kubernetes_cluster.this.private_fqdn), 1, length(split(".", azurerm_kubernetes_cluster.this.private_fqdn))))
}

