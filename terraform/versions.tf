terraform {
  required_version = ">= 1.0.0"
  experiments = [
    module_variable_optional_attrs
  ]
  required_providers {
    azurerm = {
      version = ">= 2.75.0"
    }
    random = {
      version = ">= 3.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }
  }
}
