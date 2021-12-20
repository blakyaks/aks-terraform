## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.75.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.75.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_node_pools"></a> [additional\_node\_pools](#input\_additional\_node\_pools) | (Optional) List of additional node pools to the cluster | <pre>map(object({<br>    vm_size                = optional(string)<br>    auto_scaling           = optional(bool)<br>    node_count             = optional(number)<br>    node_min_count         = optional(number)<br>    node_max_count         = optional(number)<br>    max_pods               = optional(number)<br>    taints                 = optional(list(string))<br>    labels                 = optional(map(string))<br>    enable_host_encryption = optional(bool)<br>    enable_node_public_ip  = optional(bool)<br>    os_type                = optional(string)<br>    os_disk_size_gb        = optional(number)<br>  }))</pre> | `{}` | no |
| <a name="input_aks_cluster"></a> [aks\_cluster](#input\_aks\_cluster) | AKS cluster configuration | <pre>object({<br>    admin_username  = optional(string)<br>    node_count      = optional(number)<br>    vm_size         = optional(string)<br>    auto_scaling    = optional(bool)<br>    node_min_count  = optional(number)<br>    node_max_count  = optional(number)<br>    max_pods        = optional(number)<br>    k8s_version     = optional(string)<br>    os_disk_size_gb = optional(number)<br>  })</pre> | `{}` | no |
| <a name="input_aks_network"></a> [aks\_network](#input\_aks\_network) | AKS cluster network settings | <pre>object({<br>    network_plugin     = optional(string)<br>    network_policy     = optional(string)<br>    pod_cidr           = optional(string)<br>    service_cidr       = optional(string)<br>    dns_service_ip     = optional(string)<br>    docker_bridge_cidr = optional(string)<br>    load_balancer_sku  = optional(string)<br>  })</pre> | `{}` | no |
| <a name="input_aks_storage"></a> [aks\_storage](#input\_aks\_storage) | AKS cluster storage | <pre>object({<br>    enabled                          = optional(bool)<br>    disable_public_access            = optional(bool)<br>    storage_account_tier             = optional(string)<br>    storage_account_replication_type = optional(string)<br>    storage_account_kind             = optional(string)<br>  })</pre> | `{}` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | Azure availability zones for HA deployment | `list(number)` | <pre>[<br>  1,<br>  2,<br>  3<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists | `string` | n/a | yes |
| <a name="input_names"></a> [names](#input\_names) | Map of base names to be used in the module | `map(any)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group to host AKS resources | `string` | `""` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Specifies the ID of the AKS Subnet | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(any)` | `{}` | no |
| <a name="input_tls_key"></a> [tls\_key](#input\_tls\_key) | TLS key object | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | Cluster object |
