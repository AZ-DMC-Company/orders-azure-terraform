resource "azurerm_container_app" "grafana" {
  name                     = "orders-grafana"
  resource_group_name      = azurerm_resource_group.app_rg.name
  container_app_environment_id = azurerm_container_app_environment.cae.id
  location                 = var.location
  revision_mode            = "Single"

  template {
    container {
      name   = "grafana"
      image  = "dockerhub-usuario/orders-grafana:latest"
      cpu    = 0.25
      memory = "0.5Gi"
      env {
        name  = "PROMETHEUS_URL"
        value = azurerm_container_app.prometheus.latest_revision_fqdn
      }
    }
    scale {
      min_replicas = 1
      max_replicas = 1
    }
  }

  traffic_weight {
    revision_name = "grafana"
    weight        = 100
  }
}