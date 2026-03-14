resource "azurerm_container_app" "backend" {
  name                         = "${var.workload}-backend-${var.env}-01"
  resource_group_name          = azurerm_resource_group.rg_app.name
  location                     = azurerm_resource_group.rg_app.location
  container_app_environment_id = azurerm_container_app_environment.cae.id
  revision_mode                = "Single"

  containers {
    name   = "backend"
    image  = var.backend_image
    cpu    = 0.25
    memory = "0.5Gi"
  }

  ingress {
    external_enabled = false
    target_port      = 8080
  }
}