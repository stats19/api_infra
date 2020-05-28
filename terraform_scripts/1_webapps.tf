resource "azurerm_app_service_plan" "mapinator" {
  name                = "${azurerm_resource_group.main.name}-plan"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  reserved            = true
  kind                = "Linux"

  sku {
    tier = "Standard"
    size = "S1"
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
    MYSQL_HOST=
  }

  # Configure Docker Image to load on start
  site_config {
    linux_fx_version = "DOCKER|${var.image_tag}:latest"
    always_on        = "true"
  }

}
