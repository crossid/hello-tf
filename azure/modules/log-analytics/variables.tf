variable "location" {
  description = "The Azure region where the log analytics workspace will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to deploy resources into"
  type        = string
}

variable "resource_token" {
  description = "A suffix string to centrally mitigate resource name collisions."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "The name of the log analytics workspace."
  type        = string
}

variable "sku" {
  description = "The SKU of the log analytics workspace."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "The number of days to retain log data."
  type        = number
  default     = 30
}
