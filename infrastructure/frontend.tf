resource "azurerm_container_app" "frontend" {
  name                           = "${var.workload}-frontend-${var.env}-01"
  resource_group_name            = azurerm_resource_group.rg_app.name
  location                       = azurerm_resource_group.rg_app.location
  container_app_environment_id   = azurerm_container_app_environment.cae.id
  revision_mode                  = "Single"

  template {
    container {
      name   = "frontend"
      image  = var.frontend_image
      cpu    = 0.25
      memory = "0.5Gi"
      probes {
        type = "Liveness"
        http_get {
          path = "/"
          port = 80
        }
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
    transport        = "Auto"

    traffic {
      revision_name = "frontend"
      weight        = 100
    }
  }
}