terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
  }
}

resource "azurecaf_name" "container_app_environment_storage_name" {
  name = "${var.name}-${var.resource_token}"
  # resource_type = "azurerm_container_app_environment_storage"
  resource_type = "azurerm_app_service_environment"
  random_length = 0
  clean_input   = true
}

resource "azurerm_container_app_environment_storage" "this" {
  name                         = azurecaf_name.container_app_environment_storage_name.result
  container_app_environment_id = var.container_app_environment_id
  account_name                 = var.account_name
  share_name                   = var.share_name
  access_key                   = var.access_key
  access_mode                  = var.access_mode
}
