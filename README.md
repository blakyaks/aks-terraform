# AKS-terraform

## Pre-Requisites

- Ensure Azure CLI is installed and up-to-date;
- Perform `az login` prior to executing Terraform code (or set environment variables to support the `azurerm` provider);
- If using CLI context, ensure you have targeted the correct subscription using `az account set --subscription <sub>` prior to execution.

> Note: The Terraform is not currently configured for a remote backend

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.75.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.90.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks"></a> [aks](#module\_aks) | ./modules/module_aks | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.net](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.kub_to_aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.kub_to_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_subnet.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [random_string.id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [tls_private_key.ssh](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment identifier used in resource naming convention. | `string` | `"dev"` | no |
| <a name="input_grant_load_balancer_rbac"></a> [grant\_load\_balancer\_rbac](#input\_grant\_load\_balancer\_rbac) | Grant AKS the permission to provision LoadBalancers | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region for resource creation. | `string` | `"UK South"` | no |
| <a name="input_network"></a> [network](#input\_network) | Parameters used in consruction of the ARO network resources. | <pre>object({<br>    vnet_address_space = list(string)<br>    master_subnet_cidr = list(number)<br>    worker_subnet_cidr = list(number)<br>  })</pre> | <pre>{<br>  "master_subnet_cidr": [<br>    1,<br>    0<br>  ],<br>  "vnet_address_space": [<br>    "10.10.0.0/23"<br>  ],<br>  "worker_subnet_cidr": [<br>    1,<br>    1<br>  ]<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resources. | `map(string)` | <pre>{<br>  "contact": "solutions@blakyaks.com",<br>  "source": "https://github.com/blakyaks/aks-terraform"<br>}</pre> | no |

## Outputs

No outputs.
