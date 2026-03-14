resource "azurerm_container_app" "prometheus" {
  name                         = "${var.workload}-prometheus-${var.env}-01"
  resource_group_name          = azurerm_resource_group.rg_app.name
  container_app_environment_id = azurerm_container_app_environment.cae.id
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = 9090
    transport        = "auto"

    traffic_weight {
      latest_revision = true
      percentage    = 100
    }    
  }

  template {
    container {
      name   = "prometheus"
      image  = "prom/prometheus:latest"
      cpu    = 0.25
      memory = "0.5Gi"

      # Cada variable de entorno se define con un bloque env
      env {
        name  = "PROMETHEUS_TARGET"
        value = "orders-backend-dev-01.gentleglacier-13b71ce3.eastus.azurecontainerapps.io:8080"
      }

      args = [
        "--web.enable-lifecycle",
        "--config.file=/etc/prometheus/prometheus.yml"
      ]
    }
  }
}