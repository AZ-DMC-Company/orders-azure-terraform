variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "eastus"
}

variable "existing_cae_name" {
  description = "Existing CAE name"
  type        = string  
  default     = "cae-hansqm2-dev-westus2-001"
}

variable "existing_cae_rg" {
  description = "Existing CAE name"
  type        = string  
  default     = "rg-hansqm2-dev-westus2-001"
}

variable "containerapp_backend" {
  default     = "ca-ricvera-dev-backend"
}

variable "containerapp_frontend" {
  default     = "ca-ricvera-dev-frontend"
}

variable "resource_group_name" {
  description = "Resource Group for container apps"
  type        = string
  default     = "rg-ricvera-dev-eastus-02"
}

variable "backend_image" {
  description = "Docker image for the Spring Boot API backend"
  type        = string
}

variable "frontend_image" {
  description = "Docker image for the React frontend"
  type        = string
}