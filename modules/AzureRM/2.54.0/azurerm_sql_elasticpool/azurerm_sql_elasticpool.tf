resource "azurerm_sql_elasticpool" "this" {
  # db_dtu_max - (optional) is a type of number
  db_dtu_max = var.db_dtu_max
  # db_dtu_min - (optional) is a type of number
  db_dtu_min = var.db_dtu_min
  # dtu - (required) is a type of number
  dtu = var.dtu
  # edition - (required) is a type of string
  edition = var.edition
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # pool_size - (optional) is a type of number
  pool_size = var.pool_size
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # server_name - (required) is a type of string
  server_name = var.server_name
  # tags - (optional) is a type of map of string
  tags = var.tags

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