resource "azurerm_container_app" "backend" {
  name                        = "${var.workload}-backend-${var.env}-eus-01"
  container_app_environment_id = azurerm_container_app_environment.cae.id
  location                    = azurerm_resource_group.rg_app.location
  resource_group_name         = azurerm_resource_group.rg_app.name

  revision_mode = "Single"

  template {
    container {
      name   = "backend"
      image  = var.backend_image
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name  = "SPRING_PROFILES_ACTIVE"
        value = var.env
      }
    }

    scale {
      min_replicas = 0
      max_replicas = 1
    }
  }
}