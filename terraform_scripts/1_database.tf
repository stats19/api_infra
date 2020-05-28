resource "azurerm_mysql_server" "mysql" {
  name                = "${azurerm_resource_group.main.name}-mysql-server"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku_name = "B_Gen5_2"
  storage_mb = 5120
  backup_retention_days = 7
  geo_redundant_backup_enable  = false

  administrator_login = var.database_username
  administrator_login_password = var.database_password
  ssl_enforcement = "Disabled"
  version = "5.7"

  tags = {
    environment = "production"
    group       = azurerm_resource_group.main.name
  }
}

resource "azurerm_mysql_database" "mysql" {
  name                = var.database_db
  resource_group_name = azurerm_resource_group.main.name
  server_name         = azurerm_mysql_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_mysql_firewall_rule" "mysql" {
  name                = "${azurerm_resource_group.main.name}-mysql-firewall"
  resource_group_name = azurerm_resource_group.main.name
  server_name         = azurerm_mysql_server.mysql.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}