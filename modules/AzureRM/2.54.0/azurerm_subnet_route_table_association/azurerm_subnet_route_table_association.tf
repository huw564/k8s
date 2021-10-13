resource "azurerm_subnet_route_table_association" "this" {
  # route_table_id - (required) is a type of string
  route_table_id = var.route_table_id
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