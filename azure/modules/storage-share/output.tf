output "storage_share_id" {
  description = "The ID of the storage share."
  value       = azurerm_storage_share.storage_share.id
}

output "storage_share_name" {
  description = "The name of the storage share."
  value       = azurerm_storage_share.storage_share.name
}
