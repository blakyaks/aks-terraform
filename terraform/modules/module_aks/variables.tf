variable "location" {
  description = "Specifies the supported Azure location where the resource exists"
  type        = string
}

variable "availability_zones" {
  description = "Azure availability zones for HA deployment"
  type        = list(number)
  default     = [1, 2, 3]
}

variable "resource_group_name" {
  description = "Resource group to host AKS resources"
  type        = string
  default     = ""
}

variable "additional_node_pools" {
  description = "(Optional) List of additional node pools to the cluster"
  type = map(object({
    vm_size                = optional(string)
    auto_scaling           = optional(bool)
    node_count             = optional(number)
    node_min_count         = optional(number)
    node_max_count         = optional(number)
    max_pods               = optional(number)
    taints                 = optional(list(string))
    labels                 = optional(map(string))
    enable_host_encryption = optional(bool)
    enable_node_public_ip  = optional(bool)
    os_type                = optional(string)
    os_disk_size_gb        = optional(number)
  }))
  default = {}
}

variable "aks_network" {
  description = "AKS cluster network settings"
  type = object({
    network_plugin     = optional(string)
    network_policy     = optional(string)
    pod_cidr           = optional(string)
    service_cidr       = optional(string)
    dns_service_ip     = optional(string)
    docker_bridge_cidr = optional(string)
    load_balancer_sku  = optional(string)
  })
  default = {}
}

variable "aks_storage" {
  description = "AKS cluster storage"
  type = object({
    enabled                          = optional(bool)
    disable_public_access            = optional(bool)
    storage_account_tier             = optional(string)
    storage_account_replication_type = optional(string)
    storage_account_kind             = optional(string)
  })
  default = {}
}

variable "aks_cluster" {
  description = "AKS cluster configuration"
  type = object({
    admin_username  = optional(string)
    node_count      = optional(number)
    vm_size         = optional(string)
    auto_scaling    = optional(bool)
    node_min_count  = optional(number)
    node_max_count  = optional(number)
    max_pods        = optional(number)
    k8s_version     = optional(string)
    os_disk_size_gb = optional(number)
  })
  default = {}
}

variable "subnet_id" {
  description = "Specifies the ID of the AKS Subnet"
  type        = string
}

variable "names" {
  description = "Map of base names to be used in the module"
  type        = map(any)
}

variable "tls_key" {
  description = "TLS key object"
  type        = map(any)
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(any)
  default     = {}
}
