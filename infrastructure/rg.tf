resource "azurerm_resource_group" "app_rg" {
  name     = var.app_rg_name
  location = var.location
}