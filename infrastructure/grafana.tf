
resource "azurerm_container_app" "grafana" {
  name                         = "${var.workload}-grafana-${var.env}-01"
  resource_group_name          = azurerm_resource_group.rg_app.name
  container_app_environment_id = azurerm_container_app_environment.cae.id
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = 3000
    transport        = "auto"

    traffic_weight {
      latest_revision = true
      percentage    = 100
    }    
  }

  template {
    container {
      name   = "grafana"
      image  = "grafana/grafana:latest"
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name  = "GF_SECURITY_ADMIN_USER"
        value = "admin"
      }
      env {
        name  = "GF_SECURITY_ADMIN_PASSWORD"
        value = "admin123"
      }

      # Configuración de MySQL
      env {
        name  = "GF_DATABASE_TYPE"
        value = "mysql"
      }
      env {
        name  = "GF_DATABASE_HOST"
        value = "${azurerm_mysql_server.grafana_db.fqdn}:3306"
      }
      env {
        name  = "GF_DATABASE_NAME"
        value = "grafana"
      }
      env {
        name  = "GF_DATABASE_USER"
        value = "${azurerm_mysql_server.grafana_db.administrator_login}@${azurerm_mysql_server.grafana_db.name}"
      }
      env {
        name  = "GF_DATABASE_PASSWORD"
        value = var.grafana_mysql_password
      }
    }
  }
}