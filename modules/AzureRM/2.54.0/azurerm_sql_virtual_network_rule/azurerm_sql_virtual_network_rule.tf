resource "azurerm_sql_virtual_network_rule" "this" {
  # ignore_missing_vnet_service_endpoint - (optional) is a type of bool
  ignore_missing_vnet_service_endpoint = var.ignore_missing_vnet_service_endpoint
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # server_name - (required) is a type of string
  server_name = var.server_name
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