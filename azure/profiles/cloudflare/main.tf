locals {
  subscription_id = data.azurerm_client_config.current.subscription_id
  sha             = base64encode(sha256("${var.environment_name}${var.location}${local.subscription_id}"))
  resource_token  = substr(replace(lower(local.sha), "[^A-Za-z0-9_]", ""), 0, 13)
  tags = {
    environment = var.environment_name
  }
}

module "resource-group" {
  source   = "../../modules/resource-group"
  name     = var.environment_name
  tags     = local.tags
  location = var.location
}

module "vnet" {
  source              = "../../modules/vnet"
  location            = var.location
  resource_group_name = module.resource-group.resource_group_name
  tags                = local.tags
  name                = "hello"
  resource_token      = local.resource_token
  address_space       = ["10.0.0.0/16"]
}

module "subnet" {
  source               = "../../modules/subnet"
  resource_group_name  = module.resource-group.resource_group_name
  resource_token       = local.resource_token
  name                 = "aca"
  virtual_network_name = module.vnet.vnet_name
  address_prefix       = "10.0.0.0/23"
}

