resource "azurerm_storage_account_network_rules" "this" {
  # bypass - (optional) is a type of set of string
  bypass = var.bypass
  # default_action - (required) is a type of string
  default_action = var.default_action
  # ip_rules - (optional) is a type of set of string
  ip_rules = var.ip_rules
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # storage_account_name - (required) is a type of string
  storage_account_name = var.storage_account_name
  # virtual_network_subnet_ids - (optional) is a type of set of string
  virtual_network_subnet_ids = var.virtual_network_subnet_ids

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