resource "azurerm_container_app" "frontend" {
  name                     = "${var.workload}-frontend-${var.env}-01"
  container_app_environment_id = azurerm_container_app_environment.cae.id
  resource_group_name      = azurerm_resource_group.rg_app.name
  location                 = azurerm_resource_group.rg_app.location

  revision_mode = "Single"

  # Contenedor mínimo
  container {
    name   = "frontend"
    image  = var.frontend_image
    cpu    = 0.25
    memory = "0.5Gi"
    target_port = 80
  }

  # Public Access activado
  ingress {
    external_enabled = true
    target_port      = 80
    transport        = "Auto"
  }
}