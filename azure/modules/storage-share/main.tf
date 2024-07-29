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

resource "azurecaf_name" "storage_share_name" {
  name          = "${var.name}-${var.resource_token}-share"
  resource_type = "azurerm_storage_share"
  random_length = 0
  clean_input   = true
}

resource "azurerm_storage_share" "storage_share" {
  name                 = azurecaf_name.storage_share_name.result
  storage_account_name = var.storage_account_name
  quota                = var.share_quota
}
