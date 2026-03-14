resource "azurerm_container_app" "backend" {
  name                           = "${var.workload}-backend-${var.env}-01"
  resource_group_name            = azurerm_resource_group.rg_app.name
  location                       = azurerm_resource_group.rg_app.location
  container_app_environment_id   = azurerm_container_app_environment.cae.id
  revision_mode                  = "Single"

  template {
    container {
      name        = "backend"
      image       = var.backend_image
      cpu         = 0.25
      memory      = "0.5Gi"
      probes {
        type     = "Liveness"
        http_get {
          path = "/health"
          port = 8080
        }
      }
    }

    scale {
      min_replicas = 1
      max_replicas = 1
    }
  }

  ingress {
    external_enabled = false
    target_port      = 8080

    traffic {
      revision_name = "backend"
      weight        = 100
    }
  }
}