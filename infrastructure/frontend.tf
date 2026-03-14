resource "azurerm_container_app" "frontend" {
  name                         = "${var.workload}-frontend-${var.env}-01"
  resource_group_name          = azurerm_resource_group.rg_app.name
  location                     = azurerm_resource_group.rg_app.location
  container_app_environment_id = azurerm_container_app_environment.cae.id
  revision_mode                = "Single"

  template {
    container {
      name   = "frontend"
      image  = var.frontend_image
      cpu    = 0.25
      memory = "0.5Gi"

      liveness_probe {
        http_get_path = "/"
        http_get_port = 80
      }

      readiness_probe {
        http_get_path = "/"
        http_get_port = 80
      }
    }

    scale {
      min_replicas = 1
      max_replicas = 1
    }
  }

  ingress {
    external_enabled = true
    target_port      = 80
  }
}