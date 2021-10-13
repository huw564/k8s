resource "azurerm_backup_policy_vm" "this" {
  # instant_restore_retention_days - (optional) is a type of number
  instant_restore_retention_days = var.instant_restore_retention_days
  # name - (required) is a type of string
  name = var.name
  # recovery_vault_name - (required) is a type of string
  recovery_vault_name = var.recovery_vault_name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # tags - (optional) is a type of map of string
  tags = var.tags
  # timezone - (optional) is a type of string
  timezone = var.timezone

  dynamic "backup" {
    for_each = var.backup
    content {
      # frequency - (required) is a type of string
      frequency = backup.value["frequency"]
      # time - (required) is a type of string
      time = backup.value["time"]
      # weekdays - (optional) is a type of set of string
      weekdays = backup.value["weekdays"]
    }
  }

  dynamic "retention_daily" {
    for_each = var.retention_daily
    content {
      # count - (required) is a type of number
      count = retention_daily.value["count"]
    }
  }

  dynamic "retention_monthly" {
    for_each = var.retention_monthly
    content {
      # count - (required) is a type of number
      count = retention_monthly.value["count"]
      # weekdays - (required) is a type of set of string
      weekdays = retention_monthly.value["weekdays"]
      # weeks - (required) is a type of set of string
      weeks = retention_monthly.value["weeks"]
    }
  }

  dynamic "retention_weekly" {
    for_each = var.retention_weekly
    content {
      # count - (required) is a type of number
      count = retention_weekly.value["count"]
      # weekdays - (required) is a type of set of string
      weekdays = retention_weekly.value["weekdays"]
    }
  }

  dynamic "retention_yearly" {
    for_each = var.retention_yearly
    content {
      # count - (required) is a type of number
      count = retention_yearly.value["count"]
      # months - (required) is a type of set of string
      months = retention_yearly.value["months"]
      # weekdays - (required) is a type of set of string
      weekdays = retention_yearly.value["weekdays"]
      # weeks - (required) is a type of set of string
      weeks = retention_yearly.value["weeks"]
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