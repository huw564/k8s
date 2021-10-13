resource "azurerm_servicebus_namespace" "this" {
  # capacity - (optional) is a type of number
  capacity = var.capacity
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # sku - (required) is a type of string
  sku = var.sku
  # tags - (optional) is a type of map of string
  tags = var.tags
  # zone_redundant - (optional) is a type of bool
  zone_redundant = var.zone_redundant

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

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name                       = var.diagnostic_setting_name
  target_resource_id         = var.diagnostic_setting_target_resource_id
  log_analytics_workspace_id = var.diagnostic_setting_existing_resource_id

  log {
    category = "VNetAndIPFilteringLogs"
    enabled  = var.diagnostic_setting_VNetAndIPFilteringLogs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_VNetAndIPFilteringLogs_retention_policy_enabled
      days = var.diagnostic_setting_VNetAndIPFilteringLogs_retention_policy_days
    }
  }
  log {
    category = "OperationalLogs"
    enabled  = var.diagnostic_setting_OperationalLogs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_OperationalLogs_retention_policy_enabled
      days = var.diagnostic_setting_OperationalLogs_retention_policy_days
    }
  }
  metric {
    category = "AllMetrics"
    enabled = var.diagnostic_setting_AllMetrics_enabled

    retention_policy {
      enabled = var.diagnostic_setting_AllMetrics_retention_policy_enabled
    }
  }
}