resource "azurerm_container_app" "backend" {
  name                         = "${var.workload}-backend-${var.env}-01"
  resource_group_name          = azurerm_resource_group.rg_app.name
  location                     = azurerm_resource_group.rg_app.location
  container_app_environment_id = azurerm_container_app_environment.cae.id
  revision_mode                = "Single"

  template {
    container {
      name   = "backend"
      image  = var.backend_image
      cpu    = 0.25
      memory = "0.5Gi"

      probe {
        type      = "Liveness"
        port      = 8080
        transport = "Http"
        http_get {
          path = "/health"
        }
      }

      probe {
        type      = "Readiness"
        port      = 8080
        transport = "Http"
        http_get {
          path = "/health"
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

    traffic_weight {
      revision_name = "backend"
      weight        = 100
    }
  }
}