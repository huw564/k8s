resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  # name - (required) is a type of string
  name = var.name
  # private_dns_zone_name - (required) is a type of string
  private_dns_zone_name = var.private_dns_zone_name
  # registration_enabled - (optional) is a type of bool
  registration_enabled = var.registration_enabled
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # tags - (optional) is a type of map of string
  tags = var.tags
  # virtual_network_id - (required) is a type of string
  virtual_network_id = var.virtual_network_id

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