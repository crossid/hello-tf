variable "resource_token" {
  description = "A unique token to mitigate resource name collisions."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "The name of the service."
  type        = string
}

variable "container_app_environment_id" {
  description = "The ID of the container app environment"
  type        = string
}

variable "account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "share_name" {
  description = "The name of the storage share"
  type        = string
}

variable "access_key" {
  description = "The access key for the storage account"
  type        = string
}

variable "access_mode" {
  description = "The access mode for the storage (ReadOnly or ReadWrite)"
  type        = string
  default     = "ReadOnly"

  validation {
    condition     = contains(["ReadOnly", "ReadWrite"], var.access_mode)
    error_message = "access_mode must be either 'ReadOnly' or 'ReadWrite'."
  }
}
