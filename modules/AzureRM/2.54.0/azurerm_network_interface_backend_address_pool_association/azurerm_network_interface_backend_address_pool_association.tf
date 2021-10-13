resource "azurerm_network_interface_backend_address_pool_association" "this" {
  # backend_address_pool_id - (required) is a type of string
  backend_address_pool_id = var.backend_address_pool_id
  # ip_configuration_name - (required) is a type of string
  ip_configuration_name = var.ip_configuration_name
  # network_interface_id - (required) is a type of string
  network_interface_id = var.network_interface_id

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