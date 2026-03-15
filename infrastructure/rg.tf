resource "azurerm_resource_group" "rg_app" {
  name     = "${var.workload}-rg-app-${var.env}-${var.location}-01"
  location = var.location
}