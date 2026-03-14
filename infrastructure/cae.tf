resource "azurerm_container_app_environment" "cae" {
  name                = "${var.workload}-cae-${var.env}-eus-01"
  location            = azurerm_resource_group.rg_app.location
  resource_group_name = azurerm_resource_group.rg_app.name

  dapr {
    enabled = false
  }

  logs {
    log_analytics {
      enabled = false
    }
  }
}