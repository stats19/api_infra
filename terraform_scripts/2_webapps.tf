resource "azurerm_app_service_plan" "stats19" {
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
resource "azurerm_app_service" "stats19" {
  name                = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.mapinator.id

  # Do not attach Storage by default
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    MYSQL_HOST                          = var.database_host
    MYSQL_PORT                          = var.database_port
    MYSQL_DATABASE                      = var.database_db
    MYSQL_USERNAME                      = var.database_username
    MYSQL_PASSWORD                      = var.database_password
    PORT                                = var.port
    SECRET_KEY                          = var.secret_key
    RABBIT_HOST                         = var.rabbit_host
    RABBIT_PORT                         = var.rabbit_port
    RABBIT_USERNAME                     = var.rabbit_username
    RABBIT_PASSWORD                     = var.rabbit_password
    RABBIT_ADDRESSES                    = var.rabbit_addresses
  }

  # Configure Docker Image to load on start
  site_config {
    linux_fx_version = "DOCKER|${var.image_tag}:latest"
    always_on        = "true"
  }

}
