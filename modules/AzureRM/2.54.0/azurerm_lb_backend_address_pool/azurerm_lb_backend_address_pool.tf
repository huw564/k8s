resource "azurerm_lb_backend_address_pool" "this" {
  # loadbalancer_id - (required) is a type of string
  loadbalancer_id = var.loadbalancer_id
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (optional) is a type of string
  resource_group_name = var.resource_group_name

  dynamic "backend_address" {
    for_each = var.backend_address
    content {
      # ip_address - (required) is a type of string
      ip_address = backend_address.value["ip_address"]
      # name - (required) is a type of string
      name = backend_address.value["name"]
      # virtual_network_id - (required) is a type of string
      virtual_network_id = backend_address.value["virtual_network_id"]
    }
  }

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