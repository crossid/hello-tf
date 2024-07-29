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

resource "azurecaf_name" "app_name" {
  name          = "${var.name}-${var.resource_token}"
  resource_type = "azurerm_container_app"
  random_length = 0
  clean_input   = true
}

resource "azurerm_container_app" "app" {
  name                         = azurecaf_name.app_name.result
  resource_group_name          = var.resource_group_name
  container_app_environment_id = var.container_app_environment_id
  revision_mode                = var.revision_mode

  template {
    container {
      name   = var.container.name
      image  = var.container.image
      cpu    = var.container.cpu
      memory = var.container.memory

      args = var.container.args

      dynamic "readiness_probe" {
        for_each = var.container.readiness_probe != null ? [var.container.readiness_probe] : []
        content {
          port      = readiness_probe.value.port
          transport = readiness_probe.value.transport
          path      = readiness_probe.value.path
        }
      }

      dynamic "env" {
        for_each = var.container.env
        content {
          name        = env.value.name
          value       = lookup(env.value, "value", null)
          secret_name = lookup(env.value, "secret_name", null)
        }
      }

      dynamic "volume_mounts" {
        for_each = var.container.volume_mounts != null ? var.container.volume_mounts : []
        content {
          name = volume_mounts.value.name
          path = volume_mounts.value.path
        }
      }
    }

    dynamic "volume" {
      for_each = var.volume != null ? var.volume : []
      content {
        name         = volume.value.name
        storage_name = volume.value.storage_name
        storage_type = volume.value.storage_type
      }
    }
  }

  dynamic "secret" {
    for_each = var.secret != null ? var.secret : []
    content {
      name  = secret.value.name
      value = secret.value.value
    }
  }

  dynamic "ingress" {
    for_each = var.ingress != null ? [var.ingress] : []
    content {
      allow_insecure_connections = ingress.value.allow_insecure_connections
      external_enabled           = ingress.value.external_enabled
      target_port                = ingress.value.target_port

      dynamic "traffic_weight" {
        for_each = length(ingress.value.traffic_weight) > 0 ? ingress.value.traffic_weight : []
        content {
          percentage      = traffic_weight.value.percentage
          latest_revision = traffic_weight.value.latest_revision
        }
      }
    }
  }
}
