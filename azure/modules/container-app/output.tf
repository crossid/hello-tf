output "latest_revision_qdn" {
  value = azurerm_container_app.app.ingress[0].fqdn
}
