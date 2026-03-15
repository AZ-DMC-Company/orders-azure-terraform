resource "azurerm_mysql_flexible_server" "grafana_db" {
  name                = "${var.workload}-grafana-db-${var.env}"
  resource_group_name = azurerm_resource_group.rg_app.name
  location            = "westus2"
  administrator_login    = "grafanaadmin"
  administrator_password = var.grafana_mysql_password
  backup_retention_days  = 7
  sku_name               = "Standard_B1ms"
}