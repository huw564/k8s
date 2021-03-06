output "access_policy" {
  description = "returns a list of object"
  value       = azurerm_key_vault.this.access_policy
}

output "id" {
  description = "returns a string"
  value       = azurerm_key_vault.this.id
}

output "soft_delete_enabled" {
  description = "returns a bool"
  value       = azurerm_key_vault.this.soft_delete_enabled
}

output "vault_uri" {
  description = "returns a string"
  value       = azurerm_key_vault.this.vault_uri
}

output "this" {
  value = azurerm_key_vault.this
}