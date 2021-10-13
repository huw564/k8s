output "backend_ip_configurations" {
  description = "returns a list of string"
  value       = azurerm_lb_backend_address_pool.this.backend_ip_configurations
}

output "id" {
  description = "returns a string"
  value       = azurerm_lb_backend_address_pool.this.id
}

output "load_balancing_rules" {
  description = "returns a list of string"
  value       = azurerm_lb_backend_address_pool.this.load_balancing_rules
}

output "outbound_rules" {
  description = "returns a list of string"
  value       = azurerm_lb_backend_address_pool.this.outbound_rules
}

output "resource_group_name" {
  description = "returns a string"
  value       = azurerm_lb_backend_address_pool.this.resource_group_name
}

output "this" {
  value = azurerm_lb_backend_address_pool.this
}