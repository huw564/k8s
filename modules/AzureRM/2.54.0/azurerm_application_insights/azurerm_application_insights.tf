resource "azurerm_application_insights" "this" {
  # application_type - (required) is a type of string
  application_type = var.application_type
  # daily_data_cap_in_gb - (optional) is a type of number
  daily_data_cap_in_gb = var.daily_data_cap_in_gb
  # daily_data_cap_notifications_disabled - (optional) is a type of bool
  daily_data_cap_notifications_disabled = var.daily_data_cap_notifications_disabled
  # disable_ip_masking - (optional) is a type of bool
  disable_ip_masking = var.disable_ip_masking
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # retention_in_days - (optional) is a type of number
  retention_in_days = var.retention_in_days
  # sampling_percentage - (optional) is a type of number
  sampling_percentage = var.sampling_percentage
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