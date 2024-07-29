variable "name" {
  description = "The name of the storage share."
  type        = string
}

variable "resource_token" {
  description = "A unique token to mitigate resource name collisions."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the existing storage account."
  type        = string
}

variable "share_quota" {
  description = "The maximum size of the share in gigabytes."
  type        = number
  default     = 5120
}
