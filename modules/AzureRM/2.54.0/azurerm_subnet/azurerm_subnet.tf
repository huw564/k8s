resource "azurerm_subnet" "this" {
  # address_prefix - (optional) is a type of string
  address_prefix = var.address_prefix
  # address_prefixes - (optional) is a type of list of string
  address_prefixes = var.address_prefixes
  # enforce_private_link_endpoint_network_policies - (optional) is a type of bool
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
  # enforce_private_link_service_network_policies - (optional) is a type of bool
  enforce_private_link_service_network_policies = var.enforce_private_link_service_network_policies
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # service_endpoint_policy_ids - (optional) is a type of set of string
  service_endpoint_policy_ids = var.service_endpoint_policy_ids
  # service_endpoints - (optional) is a type of list of string
  service_endpoints = var.service_endpoints
  # virtual_network_name - (required) is a type of string
  virtual_network_name = var.virtual_network_name

  dynamic "delegation" {
    for_each = var.delegation
    content {
      # name - (required) is a type of string
      name = delegation.value["name"]

      dynamic "service_delegation" {
        for_each = delegation.value.service_delegation
        content {
          # actions - (optional) is a type of list of string
          actions = service_delegation.value["actions"]
          # name - (required) is a type of string
          name = service_delegation.value["name"]
        }
      }

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