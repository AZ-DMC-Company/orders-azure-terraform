variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Resource group for Terraform state"
  type        = string
  default     = "rg-terraform-state"
}

variable "storage_account_name" {
  description = "Storage account for tfstate"
  type        = string
  default     = "tfstateplataformxyz123"
}

variable "container_name" {
  description = "Container for Terraform state"
  type        = string
  default     = "tfstate"
}