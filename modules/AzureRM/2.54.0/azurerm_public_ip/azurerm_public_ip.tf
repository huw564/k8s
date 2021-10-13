resource "azurerm_public_ip" "this" {
  # allocation_method - (required) is a type of string
  allocation_method = var.allocation_method
  # domain_name_label - (optional) is a type of string
  domain_name_label = var.domain_name_label
  # idle_timeout_in_minutes - (optional) is a type of number
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  # ip_version - (optional) is a type of string
  ip_version = var.ip_version
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # public_ip_prefix_id - (optional) is a type of string
  public_ip_prefix_id = var.public_ip_prefix_id
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # reverse_fqdn - (optional) is a type of string
  reverse_fqdn = var.reverse_fqdn
  # sku - (optional) is a type of string
  sku = var.sku
  # tags - (optional) is a type of map of string
  tags = var.tags
  # zones - (optional) is a type of list of string
  zones = var.zones

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