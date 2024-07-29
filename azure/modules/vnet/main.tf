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

data "azurerm_client_config" "current" {}

# ------------------------------------------------------------------------------------------------------
# Create a VNet
# ------------------------------------------------------------------------------------------------------
resource "azurecaf_name" "vnet_name" {
  name          = "${var.name}-${var.resource_token}"
  resource_type = "azurerm_virtual_network"
  random_length = 0
  clean_input   = true
}

resource "azurerm_virtual_network" "vnet" {
  name                = azurecaf_name.vnet_name.result
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  address_space = var.address_space
}
