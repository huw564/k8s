resource "azurerm_servicebus_topic" "this" {
  # auto_delete_on_idle - (optional) is a type of string
  auto_delete_on_idle = var.auto_delete_on_idle
  # default_message_ttl - (optional) is a type of string
  default_message_ttl = var.default_message_ttl
  # duplicate_detection_history_time_window - (optional) is a type of string
  duplicate_detection_history_time_window = var.duplicate_detection_history_time_window
  # enable_batched_operations - (optional) is a type of bool
  enable_batched_operations = var.enable_batched_operations
  # enable_express - (optional) is a type of bool
  enable_express = var.enable_express
  # enable_partitioning - (optional) is a type of bool
  enable_partitioning = var.enable_partitioning
  # max_size_in_megabytes - (optional) is a type of number
  max_size_in_megabytes = var.max_size_in_megabytes
  # name - (required) is a type of string
  name = var.name
  # namespace_name - (required) is a type of string
  namespace_name = var.namespace_name
  # requires_duplicate_detection - (optional) is a type of bool
  requires_duplicate_detection = var.requires_duplicate_detection
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # status - (optional) is a type of string
  status = var.status
  # support_ordering - (optional) is a type of bool
  support_ordering = var.support_ordering

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