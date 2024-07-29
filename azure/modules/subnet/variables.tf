variable "resource_group_name" {
  description = "The name of the resource group to deploy resources into"
  type        = string
}

variable "resource_token" {
  description = "A suffix string to centrally mitigate resource name collisions."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network where the subnets will be created"
  type        = string
}

variable "name" {
  description = "The name of the subnet."
  type        = string
}

variable "address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}
