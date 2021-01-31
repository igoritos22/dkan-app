resource "azurerm_resource_group" "dkanlab" {
  name     = var.az_group
  location = var.az_location
}

resource "azurerm_app_service_plan" "dkansvcplan" {
  name                = var.az_svcplan
  location            = azurerm_resource_group.dkanlab.location
  resource_group_name = azurerm_resource_group.dkanlab.name
  kind                = "linux"

  sku {
    tier = var.tier
    size = var.size
  }
}

resource "azurerm_app_service" "dkanapp" {
  name                = var.webapp_name
  location            = azurerm_resource_group.dkanlab.location
  resource_group_name = azurerm_resource_group.dkanlab.name
  app_service_plan_id = azurerm_app_service_plan.dkansvcplan.id

  site_config {
    linux_fx_version = var.docker_image
    always_on = true

    ftps_state = var.ftps_state
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_PASSWORD" = var.pass
    "DOCKER_REGISTRY_SERVER_URL" = var.url
    "DOCKER_REGISTRY_SERVER_USERNAME" = var.user
  }

}