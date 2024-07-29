output "vnet_id" {
  description = "The ID of the VNet"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name of the VNet"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  description = "The address space of the VNet"
  value       = azurerm_virtual_network.vnet.address_space
}
