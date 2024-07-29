output "latest_revision_fqdn" {
  description = "The FQDN of the latest revision"
  value       = length(azurerm_container_app.app.ingress) > 0 ? azurerm_container_app.app.ingress[0].fqdn : ""
}
