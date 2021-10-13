resource "azurerm_network_watcher_flow_log" "this" {
  # enabled - (required) is a type of bool
  enabled = var.enabled
  # network_security_group_id - (required) is a type of string
  network_security_group_id = var.network_security_group_id
  # network_watcher_name - (required) is a type of string
  network_watcher_name = var.network_watcher_name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # storage_account_id - (required) is a type of string
  storage_account_id = var.storage_account_id
  # version - (optional) is a type of number
  version = var.version

  dynamic "retention_policy" {
    for_each = var.retention_policy
    content {
      # days - (required) is a type of number
      days = retention_policy.value["days"]
      # enabled - (required) is a type of bool
      enabled = retention_policy.value["enabled"]
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

  dynamic "traffic_analytics" {
    for_each = var.traffic_analytics
    content {
      # enabled - (required) is a type of bool
      enabled = traffic_analytics.value["enabled"]
      # interval_in_minutes - (optional) is a type of number
      interval_in_minutes = traffic_analytics.value["interval_in_minutes"]
      # workspace_id - (required) is a type of string
      workspace_id = traffic_analytics.value["workspace_id"]
      # workspace_region - (required) is a type of string
      workspace_region = traffic_analytics.value["workspace_region"]
      # workspace_resource_id - (required) is a type of string
      workspace_resource_id = traffic_analytics.value["workspace_resource_id"]
    }
  }

}