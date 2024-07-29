module "api" {
  source = "../../modules/container-app"

  name                         = "api"
  resource_group_name          = module.resource-group.resource_group_name
  tags                         = local.tags
  resource_token               = local.resource_token
  container_app_environment_id = module.container_apps_env.aca_env_id
  revision_mode                = "Single"

  container = {
    name   = "api"
    image  = var.api_app_image
    cpu    = "0.25"
    memory = "0.5Gi"

    readiness_probe = {
      port      = 8000
      transport = "HTTP"
      path      = "/api"
    }

    env = [
      {
        name  = "HELLO_FOO"
        value = "hello!"
      },
      {
        name        = "HELLO_BAR"
        secret_name = "secret1"
      }
    ]
  }

  secret = [
    {
      name  = "secret1"
      value = "shhh"
    }
  ]

  ingress = {
    allow_insecure_connections = true
    external_enabled           = false
    target_port                = 8000
    traffic_weight = [
      {
        percentage      = 100
        latest_revision = true
      }
    ]
  }
}
