resource "azurerm_cosmosdb_account" "this" {
  # analytical_storage_enabled - (optional) is a type of bool
  analytical_storage_enabled = var.analytical_storage_enabled
  # enable_automatic_failover - (optional) is a type of bool
  enable_automatic_failover = var.enable_automatic_failover
  # enable_free_tier - (optional) is a type of bool
  enable_free_tier = var.enable_free_tier
  # enable_multiple_write_locations - (optional) is a type of bool
  enable_multiple_write_locations = var.enable_multiple_write_locations
  # ip_range_filter - (optional) is a type of string
  ip_range_filter = var.ip_range_filter
  # is_virtual_network_filter_enabled - (optional) is a type of bool
  is_virtual_network_filter_enabled = var.is_virtual_network_filter_enabled
  # key_vault_key_id - (optional) is a type of string
  key_vault_key_id = var.key_vault_key_id
  # kind - (optional) is a type of string
  kind = var.kind
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # offer_type - (required) is a type of string
  offer_type = var.offer_type
  # public_network_access_enabled - (optional) is a type of bool
  public_network_access_enabled = var.public_network_access_enabled
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "capabilities" {
    for_each = var.capabilities
    content {
      # name - (required) is a type of string
      name = capabilities.value["name"]
    }
  }

  dynamic "consistency_policy" {
    for_each = var.consistency_policy
    content {
      # consistency_level - (required) is a type of string
      consistency_level = consistency_policy.value["consistency_level"]
      # max_interval_in_seconds - (optional) is a type of number
      max_interval_in_seconds = consistency_policy.value["max_interval_in_seconds"]
      # max_staleness_prefix - (optional) is a type of number
      max_staleness_prefix = consistency_policy.value["max_staleness_prefix"]
    }
  }

  dynamic "geo_location" {
    for_each = var.geo_location
    content {
      # failover_priority - (required) is a type of number
      failover_priority = geo_location.value["failover_priority"]
      # location - (required) is a type of string
      location = geo_location.value["location"]
      # prefix - (optional) is a type of string
      prefix = geo_location.value["prefix"]
      # zone_redundant - (optional) is a type of bool
      zone_redundant = geo_location.value["zone_redundant"]
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

  dynamic "virtual_network_rule" {
    for_each = var.virtual_network_rule
    content {
      # id - (required) is a type of string
      id = virtual_network_rule.value["id"]
      # ignore_missing_vnet_service_endpoint - (optional) is a type of bool
      ignore_missing_vnet_service_endpoint = virtual_network_rule.value["ignore_missing_vnet_service_endpoint"]
    }
  }

}
