resource "azurerm_network_profile" "this" {
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "container_network_interface" {
    for_each = var.container_network_interface
    content {
      # name - (required) is a type of string
      name = container_network_interface.value["name"]

      dynamic "ip_configuration" {
        for_each = container_network_interface.value.ip_configuration
        content {
          # name - (required) is a type of string
          name = ip_configuration.value["name"]
          # subnet_id - (required) is a type of string
          subnet_id = ip_configuration.value["subnet_id"]
        }
      }

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