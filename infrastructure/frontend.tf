resource "azurerm_container_app" "frontend" {
  name                     = "orders-frontend"
  resource_group_name      = azurerm_resource_group.app_rg.name
  container_app_environment_id = azurerm_container_app_environment.cae.id
  location                 = var.location
  revision_mode            = "Single"

  template {
    container {
      name   = "frontend"
      image  = "dockerhub-usuario/orders-frontend:latest"
      cpu    = 0.25
      memory = "0.5Gi"
      env {
        name  = "API_URL"
        value = azurerm_container_app.backend_api.latest_revision_fqdn
      }
    }
    scale {
      min_replicas = 1
      max_replicas = 1
    }
  }

  traffic_weight {
    revision_name = "frontend"
    weight        = 100
  }
}