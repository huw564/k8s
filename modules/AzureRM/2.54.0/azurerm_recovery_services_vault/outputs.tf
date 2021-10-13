output "id" {
  description = "returns a string"
  value       = azurerm_recovery_services_vault.this.id
}

output "name" {
  description = "returns a string"
  value       = azurerm_recovery_services_vault.this.name
}

output "this" {
  value = azurerm_recovery_services_vault.this
}