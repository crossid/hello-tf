# basic
#
variable "location" {
  description = "The supported Azure location where the resource deployed"
  type        = string
}

variable "environment_name" {
  description = "The name of the azd environment to be deployed"
  type        = string
}

# api app variables
##
variable "api_app_image" {
  description = "The container image to be used for the API"
  type        = string
}

# ui app variables
##
variable "ui_app_image" {
  description = "The container image to be used for the UI"
  type        = string
}

# cloudflare app variables
##
variable "cloudflared_tunnel_id" {
  description = "The tunnel ID for the cloudflared service"
  type        = string
}

variable "cloudflare_app_image" {
  description = "The container image to be used for the Cloudflare app"
  type        = string
}
