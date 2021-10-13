resource "azurerm_virtual_machine_extension" "this" {
  # auto_upgrade_minor_version - (optional) is a type of bool
  auto_upgrade_minor_version = var.auto_upgrade_minor_version
  # name - (required) is a type of string
  name = var.name
  # protected_settings - (optional) is a type of string
  protected_settings = var.protected_settings
  # publisher - (required) is a type of string
  publisher = var.publisher
  # settings - (optional) is a type of string
  settings = var.settings
  # tags - (optional) is a type of map of string
  tags = var.tags
  # type - (required) is a type of string
  type = var.type
  # type_handler_version - (required) is a type of string
  type_handler_version = var.type_handler_version
  # virtual_machine_id - (required) is a type of string
  virtual_machine_id = var.virtual_machine_id

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