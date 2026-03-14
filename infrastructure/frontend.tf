resource "azurerm_container_app" "frontend" {

  name                         = "${local.workload}-frontend-${local.env}-01"
  container_app_environment_id = azurerm_container_app_environment.cae.id
  resource_group_name          = azurerm_resource_group.rg_app.name

  configuration {

    ingress {
      external_enabled = true
      target_port      = 80
      transport        = "auto"
    }

  }

  template {

    container {
      name   = "frontend"
      image  = var.frontend_image
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name  = "API_URL"
        value = "http://orders-backend-dev-01:8080"
      }
    }

  }
}