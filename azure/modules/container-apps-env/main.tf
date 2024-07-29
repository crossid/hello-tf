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

resource "azurecaf_name" "env_name" {
  name          = "${var.name}-${var.resource_token}"
  resource_type = "azurerm_container_app_environment"
  random_length = 0
  clean_input   = true
}

resource "azurerm_container_app_environment" "aca_env" {
  name                           = azurecaf_name.env_name.result
  location                       = var.location
  resource_group_name            = var.resource_group_name
  internal_load_balancer_enabled = var.internal_only
  infrastructure_subnet_id       = var.infrastructure_subnet_id
}
