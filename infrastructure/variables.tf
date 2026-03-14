variable "app_rg_name" {
  description = "Nombre del Resource Group de la aplicación"
  type        = string
  default     = "orders-rg-app-dev-eus-01"
}

variable "cae_name" {
  description = "Nombre del Container Apps Environment"
  type        = string
  default     = "orders-cae-dev-eus-01"
}

variable "location" {
  description = "Región Azure"
  type        = string
  default     = "East US"
}