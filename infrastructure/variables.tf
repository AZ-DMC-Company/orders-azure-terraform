variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Resource Group for container apps"
  type        = string
  default     = "rg-containerapps-demo"
}

variable "backend_image" {
  description = "Docker image for the Spring Boot API backend"
  type        = string
}

variable "frontend_image" {
  description = "Docker image for the React frontend"
  type        = string
}