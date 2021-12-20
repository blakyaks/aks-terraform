variable "location" {
  description = "Azure region for resource creation."
  type        = string
  default     = "UK South"
}

variable "environment" {
  description = "Environment identifier used in resource naming convention."
  type        = string
  default     = "dev"
}

variable "network" {
  description = "Parameters used in consruction of the ARO network resources."
  type = object({
    vnet_address_space = list(string)
    master_subnet_cidr = list(number)
    worker_subnet_cidr = list(number)
  })
  default = {
    vnet_address_space = ["10.10.0.0/23"]
    master_subnet_cidr = [1, 0]
    worker_subnet_cidr = [1, 1]
  }
}

variable "grant_load_balancer_rbac" {
  description = "Grant AKS the permission to provision LoadBalancers"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
  default = {
    "source"  = "https://github.com/blakyaks/aks-terraform"
    "contact" = "solutions@blakyaks.com"
  }
}
