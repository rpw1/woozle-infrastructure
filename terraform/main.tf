provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

resource "azurerm_service_plan" "linux_asp_woozle" {
  name                = "${var.region_configuration.prefix}-woozleasp"
  resource_group_name = var.resource_group_name
  location            = var.region_configuration.location
  os_type             = "Linux"
  sku_name            = var.sku_name
}

resource "azurerm_linux_web_app" "woozle_web" {
  name = "${var.region_configuration.prefix}-woozleweb"
  resource_group_name = var.resource_group_name
  location = var.region_configuration.location
  service_plan_id = azurerm_service_plan.linux_asp_woozle.id
  https_only = true

  site_config {
    always_on = false
    application_stack {
      docker_image_name = "ghcr.io/env.REPO:github.sha"
      docker_registry_url = local.web_settings.DOCKER_REGISTRY_SERVER_URL
      docker_registry_username = local.web_settings.DOCKER_REGISTRY_SERVER_USERNAME
      docker_registry_password = local.web_settings.DOCKER_REGISTRY_SERVER_PASSWORD
    }
  }

  logs {
    http_logs {
      file_system {
        retention_in_days = 7
        retention_in_mb = 100
      }
    }
  }
}