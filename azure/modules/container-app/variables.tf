variable "resource_group_name" {
  description = "The name of the resource group to deploy resources into"
  type        = string
}

variable "tags" {
  description = "A list of tags used for deployed services."
  type        = map(string)
}

variable "resource_token" {
  description = "A suffix string to centrally mitigate resource name collisions."
  type        = string
}

variable "name" {
  description = "The name of the container app"
  type        = string
}

variable "container_app_environment_id" {
  description = "The ID of the container app environment"
  type        = string
}

variable "revision_mode" {
  description = "The revision mode"
  type        = string
}

variable "container" {
  description = "The container configuration"
  type = object({
    name   = string
    image  = string
    cpu    = string
    memory = string

    args = optional(list(string))

    readiness_probe = optional(object({
      port      = number
      transport = string
      path      = string
    }), null)

    env = list(object({
      name        = string
      value       = optional(string)
      secret_name = optional(string)
    }))

    volume_mounts = optional(list(object({
      name = string
      path = string
    })), [])
  })
}

variable "volume" {
  description = "The volume configuration"
  type = list(object({
    name         = string
    storage_name = string
    storage_type = string
  }))
  default = []
}

variable "secret" {
  description = "The secret configuration"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "ingress" {
  description = "The ingress configuration"
  type = object({
    allow_insecure_connections = bool
    external_enabled           = bool
    target_port                = number
    traffic_weight = optional(list(object({
      percentage      = number
      latest_revision = bool
    })), [])
  })
  default = null
}
