resource "azurerm_container_app" "prometheus" {
  name                         = "${var.workload}-prometheus-${var.env}-01"
  resource_group_name          = azurerm_resource_group.rg_app.name
  container_app_environment_id = azurerm_container_app_environment.cae.id
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = 9090
    transport        = "auto"

    traffic_weight {
      latest_revision = true
      percentage    = 100
    }    
  }

  template {
    container {
      name   = "prometheus"
      image  = var.prometheus_image
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}