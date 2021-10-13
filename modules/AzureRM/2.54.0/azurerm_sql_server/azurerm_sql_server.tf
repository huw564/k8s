resource "azurerm_sql_server" "this" {
  # administrator_login - (required) is a type of string
  administrator_login = var.administrator_login
  # administrator_login_password - (required) is a type of string
  administrator_login_password = var.administrator_login_password
  # connection_policy - (optional) is a type of string
  connection_policy = var.connection_policy
  # extended_auditing_policy - (optional) is a type of list of object
  extended_auditing_policy = var.extended_auditing_policy
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # tags - (optional) is a type of map of string
  tags = var.tags
  # version - (required) is a type of string
  version = var.server_version

  dynamic "identity" {
    for_each = var.identity
    content {
      # type - (required) is a type of string
      type = identity.value["type"]
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