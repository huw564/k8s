output "app_settings" {
  description = "returns a map of string"
  value       = azurerm_app_service.this.app_settings
}

output "custom_domain_verification_id" {
  description = "returns a string"
  value       = azurerm_app_service.this.custom_domain_verification_id
}

output "default_site_hostname" {
  description = "returns a string"
  value       = azurerm_app_service.this.default_site_hostname
}

output "id" {
  description = "returns a string"
  value       = azurerm_app_service.this.id
}

output "outbound_ip_address_list" {
  description = "returns a list of string"
  value       = azurerm_app_service.this.outbound_ip_address_list
}

output "outbound_ip_addresses" {
  description = "returns a string"
  value       = azurerm_app_service.this.outbound_ip_addresses
}

output "possible_outbound_ip_address_list" {
  description = "returns a list of string"
  value       = azurerm_app_service.this.possible_outbound_ip_address_list
}

output "possible_outbound_ip_addresses" {
  description = "returns a string"
  value       = azurerm_app_service.this.possible_outbound_ip_addresses
}

output "site_credential" {
  description = "returns a list of object"
  value       = azurerm_app_service.this.site_credential
}

output "this" {
  value = azurerm_app_service.this
}