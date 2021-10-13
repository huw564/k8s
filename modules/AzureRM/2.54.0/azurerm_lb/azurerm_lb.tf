resource "azurerm_lb" "this" {
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # sku - (optional) is a type of string
  sku = var.sku
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "frontend_ip_configuration" {
    for_each = var.frontend_ip_configuration
    content {
      # name - (required) is a type of string
      name = frontend_ip_configuration.value["name"]
      # private_ip_address - (optional) is a type of string
      private_ip_address = frontend_ip_configuration.value["private_ip_address"]
      # private_ip_address_allocation - (optional) is a type of string
      private_ip_address_allocation = frontend_ip_configuration.value["private_ip_address_allocation"]
      # private_ip_address_version - (optional) is a type of string
      private_ip_address_version = frontend_ip_configuration.value["private_ip_address_version"]
      # public_ip_address_id - (optional) is a type of string
      public_ip_address_id = frontend_ip_configuration.value["public_ip_address_id"]
      # public_ip_prefix_id - (optional) is a type of string
      public_ip_prefix_id = frontend_ip_configuration.value["public_ip_prefix_id"]
      # subnet_id - (optional) is a type of string
      subnet_id = frontend_ip_configuration.value["subnet_id"]
      # zones - (optional) is a type of list of string
      zones = frontend_ip_configuration.value["zones"]
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