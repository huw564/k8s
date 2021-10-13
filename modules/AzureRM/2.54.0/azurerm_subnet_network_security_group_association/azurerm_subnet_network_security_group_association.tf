resource "azurerm_subnet_network_security_group_association" "this" {
  # network_security_group_id - (required) is a type of string
  network_security_group_id = var.network_security_group_id
  # subnet_id - (required) is a type of string
  subnet_id = var.subnet_id

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