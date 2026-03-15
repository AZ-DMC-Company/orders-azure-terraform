
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
      cpu    = 0.5
      memory = "1Gi"

      env {
        name  = "GF_SECURITY_ADMIN_USER"
        value = "admin"
      }
      env {
        name  = "GF_SECURITY_ADMIN_PASSWORD"
        value = "admin123"
      }

      volume_mounts {
        name = "grafana-data"
        path = "/var/lib/grafana"
      }
    }

    volume {
      name          = "grafana-data"
      storage_name  = azurerm_container_app_environment_storage.cae_storage.name
      storage_type  = "AzureFile"
    }
  }
}