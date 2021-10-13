resource "azurerm_automation_account" "this" {
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # sku_name - (required) is a type of string
  sku_name = var.sku_name
  # tags - (optional) is a type of map of string
  tags = var.tags

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
    category = "JobLogs"
    enabled  = var.diagnostic_setting_JobLogs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_JobLogs_retention_policy_enabled
      days = var.diagnostic_setting_JobLogs_retention_policy_days
    }
  }

    log {
    category = "JobStreams"
    enabled  = var.diagnostic_setting_JobStreams_enabled
    retention_policy {
      enabled = var.diagnostic_setting_JobStreams_retention_policy_enabled
      days = var.diagnostic_setting_JobStreams_retention_policy_days
    }
  }
    log {
    category = "DscNodeStatus"
    enabled  = var.diagnostic_setting_DscNodeStatus_enabled
    retention_policy {
      enabled = var.diagnostic_setting_DscNodeStatus_retention_policy_enabled
      days = var.diagnostic_setting_DscNodeStatus_retention_policy_days
    }
    }
   
  metric {
    category = "AllMetrics"
    enabled = var.diagnostic_setting_metric_enabled

    retention_policy {
      enabled = var.diagnostic_setting_metric_retention_policy_enabled
    }
  }
}
