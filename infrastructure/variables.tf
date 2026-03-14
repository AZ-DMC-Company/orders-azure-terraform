variable "location" {
  default     = "eastus"
}

variable "resource_group_name" {
  default     = "rg-ricvera-dev-eastus-02"
}

variable "container_apps_environment" {
  default     = "caericveradev01"
}

variable "containerapp_backend" {
  default     = "ca-ricvera-dev-backend"
}

variable "containerapp_frontend" {
  default     = "ca-ricvera-dev-frontend"
}

variable "container_registry" {
  default     = "cricveradev01"
}

variable "backend_image" {
  default     = "cricveradev01.azurecr.io/backend:latest"
}

variable "frontend_image" {
  default     = "cricveradev01.azurecr.io/frontend:latest"
}