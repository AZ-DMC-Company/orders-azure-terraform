resource "azurerm_container_app" "backend" {
  name                     = "${var.workload}-backend-${var.env}-01"
  container_app_environment_id = azurerm_container_app_environment.cae.id
  resource_group_name      = azurerm_resource_group.rg_app.name
  location                 = azurerm_resource_group.rg_app.location

  revision_mode = "Single"

  # Contenedor mínimo
  container {
    name   = "backend"
    image  = var.backend_image
    cpu    = 0.25
    memory = "0.5Gi"
    # Puerto de la app
    target_port = 8080
  }

  # Public Access deshabilitado porque es privado
  ingress {
    external_enabled = false
    target_port      = 8080
  }
}