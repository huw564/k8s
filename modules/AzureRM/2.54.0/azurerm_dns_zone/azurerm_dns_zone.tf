resource "azurerm_dns_zone" "this" {
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "soa_record" {
    for_each = var.soa_record
    content {
      # email - (required) is a type of string
      email = soa_record.value["email"]
      # expire_time - (optional) is a type of number
      expire_time = soa_record.value["expire_time"]
      # host_name - (required) is a type of string
      host_name = soa_record.value["host_name"]
      # minimum_ttl - (optional) is a type of number
      minimum_ttl = soa_record.value["minimum_ttl"]
      # refresh_time - (optional) is a type of number
      refresh_time = soa_record.value["refresh_time"]
      # retry_time - (optional) is a type of number
      retry_time = soa_record.value["retry_time"]
      # serial_number - (optional) is a type of number
      serial_number = soa_record.value["serial_number"]
      # tags - (optional) is a type of map of string
      tags = soa_record.value["tags"]
      # ttl - (optional) is a type of number
      ttl = soa_record.value["ttl"]
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