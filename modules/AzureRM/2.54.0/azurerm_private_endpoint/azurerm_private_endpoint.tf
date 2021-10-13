resource "azurerm_private_endpoint" "this" {
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # subnet_id - (required) is a type of string
  subnet_id = var.subnet_id
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "private_dns_zone_group" {
    for_each = var.private_dns_zone_group
    content {
      # name - (required) is a type of string
      name = private_dns_zone_group.value["name"]
      # private_dns_zone_ids - (required) is a type of list of string
      private_dns_zone_ids = private_dns_zone_group.value["private_dns_zone_ids"]
    }
  }

  dynamic "private_service_connection" {
    for_each = var.private_service_connection
    content {
      # is_manual_connection - (required) is a type of bool
      is_manual_connection = private_service_connection.value["is_manual_connection"]
      # name - (required) is a type of string
      name = private_service_connection.value["name"]
      # private_connection_resource_id - (required) is a type of string
      private_connection_resource_id = private_service_connection.value["private_connection_resource_id"]
      # request_message - (optional) is a type of string
      request_message = private_service_connection.value["request_message"]
      # subresource_names - (optional) is a type of list of string
      subresource_names = private_service_connection.value["subresource_names"]
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