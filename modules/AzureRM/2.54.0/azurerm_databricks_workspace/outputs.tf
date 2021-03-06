output "id" {
  description = "returns a string"
  value       = azurerm_databricks_workspace.this.id
}

output "managed_resource_group_id" {
  description = "returns a string"
  value       = azurerm_databricks_workspace.this.managed_resource_group_id
}

output "managed_resource_group_name" {
  description = "returns a string"
  value       = azurerm_databricks_workspace.this.managed_resource_group_name
}

output "workspace_id" {
  description = "returns a string"
  value       = azurerm_databricks_workspace.this.workspace_id
}

output "workspace_url" {
  description = "returns a string"
  value       = azurerm_databricks_workspace.this.workspace_url
}

output "this" {
  value = azurerm_databricks_workspace.this
}