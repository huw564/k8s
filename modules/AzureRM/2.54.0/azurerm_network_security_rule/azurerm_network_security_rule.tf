resource "azurerm_network_security_rule" "this" {
  # access - (required) is a type of string
  access = var.access
  # description - (optional) is a type of string
  description = var.description
  # destination_address_prefix - (optional) is a type of string
  destination_address_prefix = var.destination_address_prefix
  # destination_address_prefixes - (optional) is a type of set of string
  destination_address_prefixes = var.destination_address_prefixes
  # destination_application_security_group_ids - (optional) is a type of set of string
  destination_application_security_group_ids = var.destination_application_security_group_ids
  # destination_port_range - (optional) is a type of string
  destination_port_range = var.destination_port_range
  # destination_port_ranges - (optional) is a type of set of string
  destination_port_ranges = var.destination_port_ranges
  # direction - (required) is a type of string
  direction = var.direction
  # name - (required) is a type of string
  name = var.name
  # network_security_group_name - (required) is a type of string
  network_security_group_name = var.network_security_group_name
  # priority - (required) is a type of number
  priority = var.priority
  # protocol - (required) is a type of string
  protocol = var.protocol
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # source_address_prefix - (optional) is a type of string
  source_address_prefix = var.source_address_prefix
  # source_address_prefixes - (optional) is a type of set of string
  source_address_prefixes = var.source_address_prefixes
  # source_application_security_group_ids - (optional) is a type of set of string
  source_application_security_group_ids = var.source_application_security_group_ids
  # source_port_range - (optional) is a type of string
  source_port_range = var.source_port_range
  # source_port_ranges - (optional) is a type of set of string
  source_port_ranges = var.source_port_ranges

  dynamic "timeouts" {
    for_each = var.timeouts
    content {
      # create - (optional) is a type of string
      create = timeouts.value["create"]
      # delete - (optional) is a type of string
      delete = timeouts.value["delete"]
      # read - (optional) is a type of string
      read = timeouts.value["read"]
      # update - (optional) is a type of string
      update = timeouts.value["update"]
    }
  }

}