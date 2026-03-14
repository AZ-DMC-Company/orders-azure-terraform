resource "azurerm_container_app_environment" "cae" {

  name                = "${local.workload}-cae-${local.env}-${local.region}-01"
  location            = azurerm_resource_group.rg_app.location
  resource_group_name = azurerm_resource_group.rg_app.name
}