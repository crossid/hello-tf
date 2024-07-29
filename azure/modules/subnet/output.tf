output "subnet_id" {
  description = "The ID of the subnet."
  value       = azurerm_subnet.subnet.id
}

output "subnet_name" {
  description = "The name of the subnet."
  value       = azurerm_subnet.subnet.name
}

output "subnet_address_prefix" {
  description = "The address prefix of the subnet."
  value       = azurerm_subnet.subnet.address_prefixes
}
