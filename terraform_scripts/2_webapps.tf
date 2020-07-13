resource "azurerm_app_service_plan" "mapinator" {
  name                = "${azurerm_resource_group.main.name}-plan"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  reserved            = true
  kind                = "Linux"

  sku {
    tier     = "Standard"
    size     = "S1"
    capacity = 5
  }
}

# Create an Azure Web App for Containers in that App Service Plan
resource "azurerm_app_service" "mapinator" {
  name                = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.mapinator.id

  # Do not attach Storage by default
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    MYSQL_HOST                          = azurerm_mysql_server.mysql.fqdn
    MYSQL_PORT                          = var.database_port
    MYSQL_DATABASE                      = var.database_db
    MYSQL_USERNAME                      = "${var.database_username}@${azurerm_mysql_server.mysql.name}"
    MYSQL_PASSWORD                      = var.database_password
    PORT                                = var.port
    GOOGLE_API_KEY                      = var.google_api_key
    MAP_API_URL                         = var.map_api_url
    LUCENE_FOLDER                       = var.lucene_path
  }

  # Configure Docker Image to load on start
  site_config {
    linux_fx_version = "DOCKER|${var.image_tag}:latest"
    always_on        = "true"
  }

  connection_string {
    name  = "Database"
    type  = "MySql"
    value = "Server=${azurerm_mysql_server.mysql.fqdn};Integrated Security=SSPI"
  }

}
