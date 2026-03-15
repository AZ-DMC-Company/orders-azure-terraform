resource "azurerm_mysql_flexible_server" "grafana_db" {
  name                = "${var.workload}-grafana-db-${var.env}"
  resource_group_name = azurerm_resource_group.rg_app.name
  location            = azurerm_resource_group.rg_app.location

  version             = "5.7"
  administrator_login = "grafanaadmin"
  administrator_password = var.grafana_mysql_password

  sku_name = "B1MS"            # Gratis / mínimo
  storage_mb = 32               # mínimo permitido
  backup_retention_days = 7
  auto_grow_enabled     = true
  publicly_accessible   = true
}