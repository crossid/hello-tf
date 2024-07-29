variable "location" {
  description = "The Azure region where the container apps environment will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the container apps environment."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "resource_token" {
  description = "A suffix string to centrally mitigate resource name collisions."
  type        = string
}

variable "name" {
  description = "The name of the container apps environment."
  type        = string
}

variable "internal_only" {
  description = "Specifies if the container apps environment should be internal only."
  type        = bool
  default     = true
}

variable "logs_workspace_id" {
  description = "The ID of the log analytics workspace for storing logs."
  type        = string
}

variable "infrastructure_subnet_id" {
  description = "The resource ID of the subnet for infrastructure."
  type        = string
}

