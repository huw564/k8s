output "id" {
  description = "returns a string"
  value       = azurerm_backup_policy_vm.this.id
}

output "instant_restore_retention_days" {
  description = "returns a number"
  value       = azurerm_backup_policy_vm.this.instant_restore_retention_days
}

output "this" {
  value = azurerm_backup_policy_vm.this
}