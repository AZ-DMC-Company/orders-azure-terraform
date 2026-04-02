resource "azurerm_container_app" "backend" {
  name                         = "${var.workload}-backend-${var.env}-01"
  resource_group_name          = azurerm_resource_group.rg_app.name
  container_app_environment_id = azurerm_container_app_environment.cae.id
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = 8080
    transport        = "auto"

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  template {
    container {
      name   = "backend"
      image  = var.backend_image
      cpu    = 0.5
      memory = "1.0Gi"

      env {
        name  = "MYSQL_URL"
        value = var.mysql_url  
      }
      env {
        name  = "MYSQL_USER"
        value = var.mysql_user 
      }
      env {
        name  = "MYSQL_PASSWORD"
        value = var.mysql_password
      }
      env {
        name  = "JWT_SECRET"
        value = var.jwt_secret
      }
    }
  } 
}