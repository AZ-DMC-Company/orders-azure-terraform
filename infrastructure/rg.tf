resource "azurerm_resource_group" "rg_app" {
  name     = "${var.workload}-rg-app-${var.env}-eus-01"
  location = var.location
}