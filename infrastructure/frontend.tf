resource "azurerm_container_app" "frontend" {
  name                        = "${var.workload}-frontend-${var.env}-eus-01"
  container_app_environment_id = azurerm_container_app_environment.cae.id
  location                    = azurerm_resource_group.rg_app.location
  resource_group_name         = azurerm_resource_group.rg_app.name

  revision_mode = "Single"

  template {
    container {
      name   = "frontend"
      image  = var.frontend_image
      cpu    = 0.25
      memory = "0.5Gi"
    }

    scale {
      min_replicas = 0
      max_replicas = 1
    }
  }

  traffic {
    latest_revision = true
    weight          = 100
  }
}