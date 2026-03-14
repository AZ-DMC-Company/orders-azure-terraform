resource "azurerm_container_app" "mysql" {
  name                     = "orders-mysql"
  resource_group_name      = azurerm_resource_group.app_rg.name
  container_app_environment_id = azurerm_container_app_environment.cae.id
  location                 = var.location
  revision_mode            = "Single"

  template {
    container {
      name   = "mysql"
      image  = "dockerhub-usuario/orders-mysql:latest"
      cpu    = 0.25
      memory = "0.5Gi"
      env {
        name  = "MYSQL_ROOT_PASSWORD"
        value = "rootpassword"
      }
      env {
        name  = "MYSQL_DATABASE"
        value = "ordersdb"
      }
    }
  }
}