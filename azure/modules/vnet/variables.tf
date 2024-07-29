variable "location" {
  description = "The supported Azure location where the resource deployed"
  type        = string
}

variable "rg_name" {
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
  description = "The name of the VNet."
  type        = string
  default     = "primary"
}

variable "address_space" {
  description = "The address space that will be used for the VNet."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
