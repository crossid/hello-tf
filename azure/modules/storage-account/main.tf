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

resource "azurecaf_name" "storage_account_name" {
  name          = "${var.name}-${var.resource_token}"
  resource_type = "azurerm_storage_account"
  random_length = 0
  clean_input   = true
}

resource "azurerm_storage_account" "storage_account" {
  location                 = var.location
  resource_group_name      = var.resource_group_name
  tags                     = var.tags
  name                     = azurecaf_name.storage_account_name.result
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
