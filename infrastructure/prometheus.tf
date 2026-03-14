resource "azurerm_container_app" "prometheus" {
  name                     = "orders-prometheus"
  resource_group_name      = azurerm_resource_group.app_rg.name
  container_app_environment_id = azurerm_container_app_environment.cae.id
  location                 = var.location
  revision_mode            = "Single"

  template {
    container {
      name   = "prometheus"
      image  = "dockerhub-usuario/orders-prometheus:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}