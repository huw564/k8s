output "extended_auditing_policy" {
  description = "returns a list of object"
  value       = azurerm_sql_server.this.extended_auditing_policy
}

output "fully_qualified_domain_name" {
  description = "returns a string"
  value       = azurerm_sql_server.this.fully_qualified_domain_name
}

output "id" {
  description = "returns a string"
  value       = azurerm_sql_server.this.id
}

output "this" {
  value = azurerm_sql_server.this
}

output "name" {
  value = azurerm_sql_server.this.name
}