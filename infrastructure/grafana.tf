resource "azurerm_storage_share" "grafana" {
  name               = "grafana"
  storage_account_id = azurerm_storage_account.tf_state.id
  quota              = 1
}

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

      # La clave aquí es `volume_mounts { name = <volume>, path = <mount_path> }`
      volume_mounts {
        name = "grafana-data"
        path = "/var/lib/grafana"  # <- tu mount path
      }
    }

    # Define un solo `volume` (no plural `volumes`)
    volume {
      name = "grafana-data"

      azure_file {
        storage_account_name = azurerm_storage_account.tf_state.name
        share_name           = azurerm_storage_share.grafana.name
        read_only            = false
      }
    }
  }
}