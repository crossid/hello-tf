# Storage Account
module "storage_account" {
  source              = "../../modules/storage-account"
  resource_group_name = module.resource-group.resource_group_name
  resource_token      = local.resource_token
  location            = var.location
  tags                = local.tags
  name                = "hello"
}

module "storage_share" {
  source               = "../../modules/storage-share"
  name                 = "hello"
  resource_token       = local.resource_token
  storage_account_name = module.storage_account.storage_account_name
  share_quota          = 1
}

module "container_app_environment_storage" {
  source                       = "../../modules/container-apps-env-storage"
  resource_token               = local.resource_token
  name                         = "aca"
  container_app_environment_id = module.container_apps_env.aca_env_id
  account_name                 = module.storage_account.storage_account_name
  share_name                   = module.storage_share.storage_share_name
  access_key                   = module.storage_account.storage_account_primary_access_key
  access_mode                  = "ReadOnly"
}

resource "local_file" "cloudflared_config" {
  content = templatefile("${path.module}/cloudflared_config.tpl", {
    TUNNEL_ID       = var.cloudflared_tunnel_id
    API_SERVICE_URL = module.api_app.latest_revision_fqdn
    UI_SERVICE_URL  = module.ui_app.latest_revision_fqdn
  })
  filename = "${data.external.temp_dir.result.temp_dir}/cloudflared_config.yml"
}

resource "azurerm_storage_share_file" "upload_config" {
  name             = "config.yml"
  storage_share_id = module.storage_share.storage_share_id
  source           = "${data.external.temp_dir.result.temp_dir}/cloudflared_config.yml"
}

resource "azurerm_storage_share_file" "upload_tunnel" {
  name             = "${var.cloudflared_tunnel_id}.json"
  storage_share_id = module.storage_share.storage_share_id
  source           = "${path.module}/${var.cloudflared_tunnel_id}.json"
}

module "cloudflare_app" {
  source = "../../modules/container-app"

  name                         = "cloudflare"
  resource_group_name          = module.resource-group.resource_group_name
  tags                         = local.tags
  resource_token               = local.resource_token
  container_app_environment_id = module.container_apps_env.aca_env_id
  revision_mode                = "Single"

  container = {
    name   = "cloudflare"
    image  = var.cloudflare_app_image
    cpu    = "0.25"
    memory = "0.5Gi"
    args   = ["tunnel", "--protocol", "http2", "run"]
    env    = []

    volume_mounts = [{
      name = "cloudflared-config"
      path = "/etc/cloudflared"
    }]
  }

  volume = [{
    name         = "cloudflared-config"
    storage_name = module.container_app_environment_storage.name
    storage_type = "AzureFile"
  }]
}
