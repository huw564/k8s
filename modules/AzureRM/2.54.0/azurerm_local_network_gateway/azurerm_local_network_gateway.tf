resource "azurerm_local_network_gateway" "this" {
  # address_space - (optional) is a type of list of string
  address_space = var.address_space
  # gateway_address - (optional) is a type of string
  gateway_address = var.gateway_address
  # gateway_fqdn - (optional) is a type of string
  gateway_fqdn = var.gateway_fqdn
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "bgp_settings" {
    for_each = var.bgp_settings
    content {
      # asn - (required) is a type of number
      asn = bgp_settings.value["asn"]
      # bgp_peering_address - (required) is a type of string
      bgp_peering_address = bgp_settings.value["bgp_peering_address"]
      # peer_weight - (optional) is a type of number
      peer_weight = bgp_settings.value["peer_weight"]
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