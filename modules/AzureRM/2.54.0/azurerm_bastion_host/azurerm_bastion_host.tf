resource "azurerm_bastion_host" "this" {
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "ip_configuration" {
    for_each = var.ip_configuration
    content {
      # name - (required) is a type of string
      name = ip_configuration.value["name"]
      # public_ip_address_id - (required) is a type of string
      public_ip_address_id = ip_configuration.value["public_ip_address_id"]
      # subnet_id - (required) is a type of string
      subnet_id = ip_configuration.value["subnet_id"]
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
