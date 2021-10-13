resource "azurerm_network_interface" "this" {
  # dns_servers - (optional) is a type of list of string
  dns_servers = var.dns_servers
  # enable_accelerated_networking - (optional) is a type of bool
  enable_accelerated_networking = var.enable_accelerated_networking
  # enable_ip_forwarding - (optional) is a type of bool
  enable_ip_forwarding = var.enable_ip_forwarding
  # internal_dns_name_label - (optional) is a type of string
  internal_dns_name_label = var.internal_dns_name_label
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "ip_configuration" {
    for_each = var.ip_configuration
    content {
      # name - (required) is a type of string
      name = ip_configuration.value["name"]
      # primary - (optional) is a type of bool
      primary = ip_configuration.value["primary"]
      # private_ip_address - (optional) is a type of string
      private_ip_address = ip_configuration.value["private_ip_address"]
      # private_ip_address_allocation - (required) is a type of string
      private_ip_address_allocation = ip_configuration.value["private_ip_address_allocation"]
      # private_ip_address_version - (optional) is a type of string
      private_ip_address_version = ip_configuration.value["private_ip_address_version"]
      # public_ip_address_id - (optional) is a type of string
      public_ip_address_id = ip_configuration.value["public_ip_address_id"]
      # subnet_id - (optional) is a type of string
      subnet_id = ip_configuration.value["subnet_id"]
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