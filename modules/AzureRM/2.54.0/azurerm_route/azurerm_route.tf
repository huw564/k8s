resource "azurerm_route" "this" {
  # address_prefix - (required) is a type of string
  address_prefix = var.address_prefix
  # name - (required) is a type of string
  name = var.name
  # next_hop_in_ip_address - (optional) is a type of string
  next_hop_in_ip_address = var.next_hop_in_ip_address
  # next_hop_type - (required) is a type of string
  next_hop_type = var.next_hop_type
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # route_table_name - (required) is a type of string
  route_table_name = var.route_table_name

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