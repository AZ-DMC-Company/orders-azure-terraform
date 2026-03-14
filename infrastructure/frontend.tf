resource "azurerm_container_app" "frontend" {
  name                         = "${var.workload}-frontend-${var.env}-01"
  resource_group_name          = azurerm_resource_group.rg_app.name
  location                     = azurerm_resource_group.rg_app.location
  container_app_environment_id = azurerm_container_app_environment.cae.id
  revision_mode                = "Single"

  containers {
    name   = "frontend"
    image  = var.frontend_image
    cpu    = 0.25
    memory = "0.5Gi"
  }

  ingress {
    external_enabled = true
    target_port      = 80
  }
}