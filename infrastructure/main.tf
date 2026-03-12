resource "azurerm_resource_group" "apps" {
  name     = var.resource_group_name
  location = var.location
}

data  "azurerm_container_app_environment" "env" {
  name                       = var.existing_containerappsenvironment.name
  resource_group_name        = var.existing_containerappsenvironment.rg
}

resource "azurerm_container_app" "backend" {
  name                         = var.containerapp_backend
  container_app_environment_id = data.azurerm_container_app_environment.env.id
  resource_group_name          = data.azurerm_resource_group.apps.name
  revision_mode                = "Single"

  template {
    container {
      name   = var.containerapp_backend
      image  = var.backend_image
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  ingress {
    external_enabled = true
    target_port      = 8080

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}

resource "azurerm_container_app" "frontend" {
  name                         = var.containerapp_frontend
  container_app_environment_id = azurerm_container_app_environment.env.id
  resource_group_name          = azurerm_resource_group.apps.name
  revision_mode                = "Single"

  template {
    container {
      name   = var.containerapp_frontend
      image  = var.frontend_image
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name  = "REACT_APP_API_URL"
        value = "https://${azurerm_container_app.backend.latest_revision_fqdn}"
      }
    }
  }

  ingress {
    external_enabled = true
    target_port      = 80

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}