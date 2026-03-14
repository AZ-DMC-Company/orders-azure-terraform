resource "azurerm_container_app" "backend_api" {
  name                     = "orders-backend-api"
  resource_group_name      = azurerm_resource_group.app_rg.name
  container_app_environment_id = azurerm_container_app_environment.cae.id
  location                 = var.location
  revision_mode            = "Single"

  template {
    container {
      name   = "backend-api"
      image  = "dockerhub-usuario/orders-backend:latest"
      cpu    = 0.25
      memory = "0.5Gi"
      env {
        name  = "MYSQL_HOST"
        value = "orders-mysql"
      }
    }
  }
}