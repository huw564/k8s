output "custom_dns_configs" {
  description = "returns a list of object"
  value       = azurerm_private_endpoint.this.custom_dns_configs
}

output "id" {
  description = "returns a string"
  value       = azurerm_private_endpoint.this.id
}

output "private_dns_zone_configs" {
  description = "returns a list of object"
  value       = azurerm_private_endpoint.this.private_dns_zone_configs
}

output "this" {
  value = azurerm_private_endpoint.this
}