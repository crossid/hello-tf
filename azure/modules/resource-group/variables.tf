variable "location" {
  description = "The supported Azure location where the resource deployed"
  type        = string
}

variable "name" {
  description = "The name of the azd environment to be deployed"
  type        = string
}

variable "tags" {
  description = "A list of tags used for deployed services."
  type        = map(string)
}
