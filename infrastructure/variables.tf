variable "backend_image" {
  type        = string
  description = "Docker image del backend Java Spring"
}

variable "frontend_image" {
  type        = string
  description = "Docker image del frontend Angular"
}

variable "prometheus_image" {
  type        = string
  description = "Docker image del Prometheus"
}

variable "location" {
  type    = string
  default = "westus2"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "workload" {
  type    = string
  default = "orders"
}

variable "mysql_user" {
  description = "User for MySQL admin"
  type        = string
}

variable "mysql_password" {
  description = "Password for MySQL admin"
  type        = string
  sensitive   = true
}

variable "grafana_user" {
  description = "User for Grafana admin"
  type        = string
}

variable "grafana_password" {
  description = "Password for Grafana admin"
  type        = string
  sensitive   = true
}