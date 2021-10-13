resource "azurerm_virtual_network_peering" "this" {
  # allow_forwarded_traffic - (optional) is a type of bool
  allow_forwarded_traffic = var.allow_forwarded_traffic
  # allow_gateway_transit - (optional) is a type of bool
  allow_gateway_transit = var.allow_gateway_transit
  # allow_virtual_network_access - (optional) is a type of bool
  allow_virtual_network_access = var.allow_virtual_network_access
  # name - (required) is a type of string
  name = var.name
  # remote_virtual_network_id - (required) is a type of string
  remote_virtual_network_id = var.remote_virtual_network_id
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # use_remote_gateways - (optional) is a type of bool
  use_remote_gateways = var.use_remote_gateways
  # virtual_network_name - (required) is a type of string
  virtual_network_name = var.virtual_network_name

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