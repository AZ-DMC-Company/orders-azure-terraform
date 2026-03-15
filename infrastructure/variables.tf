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

variable "grafana_mysql_password" {
  description = "Password for Grafana MySQL admin"
  type        = string
  sensitive   = true
}