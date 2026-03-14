resource "azurerm_container_app" "prometheus" {
  name                         = "${var.workload}-${var.env}-01"
  resource_group_name          = azurerm_resource_group.rg_app.name
  container_app_environment_id = azurerm_container_app_environment.cae.id
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = 9090
    transport        = "auto"
  }

  template {
    container {
      name   = "prometheus"
      image  = "prom/prometheus:latest"
      cpu    = 0.25
      memory = "0.5Gi"

      # Esto sirve para dev: Prometheus usa la URL del backend público directamente
      environment_variables = {
        PROMETHEUS_TARGET = "orders-backend-dev-01.gentleglacier-13b71ce3.eastus.azurecontainerapps.io:8080"
      }

      args = [
        "--web.enable-lifecycle",
        "--config.file=/etc/prometheus/prometheus.yml"
      ]
    }
  }
}