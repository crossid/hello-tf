output "aca_env_id" {
  description = "The ID of the container apps environment."
  value       = azurerm_container_app_environment.aca_env.id
}

output "aca_env_name" {
  description = "The name of the container apps environment."
  value       = azurerm_container_app_environment.aca_env.name
}
