resource "azurerm_log_analytics_workspace" "this" {
  # daily_quota_gb - (optional) is a type of number
  daily_quota_gb = var.daily_quota_gb
  # internet_ingestion_enabled - (optional) is a type of bool
  internet_ingestion_enabled = var.internet_ingestion_enabled
  # internet_query_enabled - (optional) is a type of bool
  internet_query_enabled = var.internet_query_enabled
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # reservation_capcity_in_gb_per_day - (optional) is a type of number
  reservation_capcity_in_gb_per_day = var.reservation_capcity_in_gb_per_day
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # retention_in_days - (optional) is a type of number
  retention_in_days = var.retention_in_days
  # sku - (optional) is a type of string
  sku = var.sku
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