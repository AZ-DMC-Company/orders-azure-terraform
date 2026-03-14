resource "azurerm_resource_group" "rg_app" {

  name     = "${local.workload}-rg-app-${local.env}-${local.region}-01"
  location = "East US"

  tags = {
    environment = local.env
    project     = local.workload
  }
}