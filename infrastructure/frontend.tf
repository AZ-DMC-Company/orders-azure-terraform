resource "azurerm_container_app" "frontend" {
  name                         = "${var.workload}-frontend-${var.env}-01"
  resource_group_name          = azurerm_resource_group.rg_app.name
  container_app_environment_id = azurerm_container_app_environment.cae.id
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = 80
    transport        = "auto"

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  # 🔹 Esto asegura que frontend se cree **después del backend**
  depends_on = [
    azurerm_container_app.backend
  ]

  template {
    container {
      name   = "frontend"
      image  = var.frontend_image
      cpu    = 0.26
      memory = "0.5Gi"

      # ✅ Variable de entorno dinámica apuntando al backend
      env {
        name  = "BACKEND_URL"
        value = "https://${azurerm_container_app.backend.latest_revision_fqdn}/orders"
      }
    }
  }
}