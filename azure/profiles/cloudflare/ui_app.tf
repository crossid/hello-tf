module "ui_app" {
  source = "../../modules/container-app"

  name                         = "ui"
  resource_group_name          = module.resource-group.resource_group_name
  tags                         = local.tags
  resource_token               = local.resource_token
  container_app_environment_id = module.container_apps_env.aca_env_id
  revision_mode                = "Single"

  container = {
    name   = "ui"
    image  = var.ui_app_image
    cpu    = "0.25"
    memory = "0.5Gi"

    readiness_probe = {
      port      = 3000
      transport = "HTTP"
      path      = "/ui"
    }

    env = [
      {
        name  = "BACKEND_URI"
        value = "https://${module.api_app.latest_revision_qdn}/api"
      }
    ]
  }

  ingress = {
    allow_insecure_connections = true
    external_enabled           = false
    target_port                = 3000
    traffic_weight = [
      {
        percentage      = 100
        latest_revision = true
      }
    ]
  }
}
