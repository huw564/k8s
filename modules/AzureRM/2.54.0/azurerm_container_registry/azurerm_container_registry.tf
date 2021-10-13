resource "azurerm_container_registry" "this" {
  # admin_enabled - (optional) is a type of bool
  admin_enabled = var.admin_enabled
  # georeplication_locations - (optional) is a type of set of string
  georeplication_locations = var.georeplication_locations
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # network_rule_set - (optional) is a type of list of object
  network_rule_set = var.network_rule_set
  # public_network_access_enabled - (optional) is a type of bool
  public_network_access_enabled = var.public_network_access_enabled
  # quarantine_policy_enabled - (optional) is a type of bool
  quarantine_policy_enabled = var.quarantine_policy_enabled
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # retention_policy - (optional) is a type of list of object
  retention_policy = var.retention_policy
  # sku - (optional) is a type of string
  sku = var.sku
  # storage_account_id - (optional) is a type of string
  storage_account_id = var.storage_account_id
  # tags - (optional) is a type of map of string
  tags = var.tags
  # trust_policy - (optional) is a type of list of object
  trust_policy = var.trust_policy

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
