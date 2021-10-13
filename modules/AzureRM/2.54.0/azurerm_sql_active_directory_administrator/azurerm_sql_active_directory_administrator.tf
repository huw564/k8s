resource "azurerm_sql_active_directory_administrator" "this" {
  # login - (required) is a type of string
  login = var.login
  # object_id - (required) is a type of string
  object_id = var.object_id
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # server_name - (required) is a type of string
  server_name = var.server_name
  # tenant_id - (required) is a type of string
  tenant_id = var.tenant_id

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