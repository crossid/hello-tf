terraform {
  required_providers {
    azurerm = {
      version = "3.113.0"
      source  = "hashicorp/azurerm"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~>1.2.28"
    }
  }
}

provider "azurerm" {
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block
  features {
  }
}

provider "azurecaf" {
}

# Make client_id, tenant_id, subscription_id and object_id variables
data "azurerm_client_config" "current" {}

data "azurerm_subscription" "primary" {}
