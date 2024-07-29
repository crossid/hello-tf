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

module "log_analytics_workspace" {
  source              = "../../modules/log-analytics"
  resource_group_name = module.resource-group.resource_group_name
  resource_token      = local.resource_token
  tags                = local.tags
  name                = "hello"
  location            = var.location
}

module "container_apps_env" {
  source                   = "../../modules/container-apps-env"
  name                     = "hello"
  location                 = var.location
  resource_group_name      = module.resource-group.resource_group_name
  resource_token           = local.resource_token
  tags                     = local.tags
  logs_workspace_id        = module.log_analytics_workspace.workspace_id
  infrastructure_subnet_id = module.subnet.subnet_id
  internal_only            = true
}

data "external" "temp_dir" {
  program = ["sh", "${path.module}/get_temp_dir.sh"]
}
