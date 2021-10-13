resource "azurerm_storage_container" "this" {
  # container_access_type - (optional) is a type of string
  container_access_type = var.container_access_type
  # metadata - (optional) is a type of map of string
  metadata = var.metadata
  # name - (required) is a type of string
  name = var.name
  # storage_account_name - (required) is a type of string
  storage_account_name = var.storage_account_name

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