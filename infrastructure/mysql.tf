resource "azurerm_mysql_flexible_server" "mysql_server" {
  name                = "${var.workload}-mysqlserver-${var.env}"
  resource_group_name = azurerm_resource_group.rg_app.name
  location            = azurerm_resource_group.rg_app.location
  administrator_login    = "grafanaadmin"
  administrator_password = var.mysql_password
  sku_name               = "B_Standard_B1ms"
}

resource "azurerm_mysql_flexible_database" "grafana_db" {
  name                = "grafana"
  resource_group_name = azurerm_resource_group.rg_app.name
  server_name         = azurerm_mysql_flexible_server.mysql_server.name
  charset             = "utf8mb4"
  collation           = "utf8mb4_general_ci"
}