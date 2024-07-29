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

resource "azurecaf_name" "log_analytics_workspace" {
  name          = "${var.name}-${var.resource_token}"
  resource_type = "azurerm_log_analytics_workspace"
  random_length = 0
  clean_input   = true
}

resource "azurerm_log_analytics_workspace" "workspace" {
  resource_group_name = var.resource_group_name
  name                = azurecaf_name.log_analytics_workspace.result
  location            = var.location
  sku                 = var.sku

  retention_in_days = var.retention_in_days

  tags = var.tags
}
