resource "azurerm_container_app" "backend" {

  name                         = "${local.workload}-backend-${local.env}-01"
  container_app_environment_id = azurerm_container_app_environment.cae.id
  resource_group_name          = azurerm_resource_group.rg_app.name

  configuration {

    ingress {
      external_enabled = false
      target_port      = 8080
    }

  }

  template {

    container {
      name   = "backend"
      image  = var.backend_image
      cpu    = 0.25
      memory = "0.5Gi"
    }

  }
}