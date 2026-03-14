resource "azurerm_container_app_environment" "cae" {
  name                = var.cae_name
  location            = var.location
  resource_group_name = azurerm_resource_group.app_rg.name
  dapr_enabled        = true
  log_analytics {
    customer_id = "<log-analytics-id-placeholder>"
    shared_key  = "<log-analytics-key-placeholder>"
  }
}