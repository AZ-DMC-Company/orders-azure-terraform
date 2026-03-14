variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Resource group for Terraform state"
  type        = string
  default     = "rg-ricvera-dev-eastus-01"
}

variable "storage_account_name" {
  description = "Storage account for tfstate"
  type        = string
  default     = "tfstatericveradev02"
}

variable "container_name" {
  description = "Container for Terraform state"
  type        = string
  default     = "tfstate-ricvera-dev"
}
