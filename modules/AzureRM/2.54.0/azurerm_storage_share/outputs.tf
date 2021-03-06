output "id" {
  description = "returns a string"
  value       = azurerm_storage_share.this.id
}

output "metadata" {
  description = "returns a map of string"
  value       = azurerm_storage_share.this.metadata
}

output "resource_manager_id" {
  description = "returns a string"
  value       = azurerm_storage_share.this.resource_manager_id
}

output "url" {
  description = "returns a string"
  value       = azurerm_storage_share.this.url
}

output "this" {
  value = azurerm_storage_share.this
}