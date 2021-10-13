resource "azurerm_search_service" "this" {
  # allowed_ips - (optional) is a type of list of string
  allowed_ips = var.allowed_ips
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # partition_count - (optional) is a type of number
  partition_count = var.partition_count
  # public_network_access_enabled - (optional) is a type of bool
  public_network_access_enabled = var.public_network_access_enabled
  # replica_count - (optional) is a type of number
  replica_count = var.replica_count
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # sku - (required) is a type of string
  sku = var.sku
  # tags - (optional) is a type of map of string
  tags = var.tags

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