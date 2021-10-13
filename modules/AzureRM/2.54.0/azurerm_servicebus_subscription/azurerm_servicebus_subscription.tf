resource "azurerm_servicebus_subscription" "this" {
  # auto_delete_on_idle - (optional) is a type of string
  auto_delete_on_idle = var.auto_delete_on_idle
  # dead_lettering_on_filter_evaluation_error - (optional) is a type of bool
  dead_lettering_on_filter_evaluation_error = var.dead_lettering_on_filter_evaluation_error
  # dead_lettering_on_message_expiration - (optional) is a type of bool
  dead_lettering_on_message_expiration = var.dead_lettering_on_message_expiration
  # default_message_ttl - (optional) is a type of string
  default_message_ttl = var.default_message_ttl
  # enable_batched_operations - (optional) is a type of bool
  enable_batched_operations = var.enable_batched_operations
  # forward_dead_lettered_messages_to - (optional) is a type of string
  forward_dead_lettered_messages_to = var.forward_dead_lettered_messages_to
  # forward_to - (optional) is a type of string
  forward_to = var.forward_to
  # lock_duration - (optional) is a type of string
  lock_duration = var.lock_duration
  # max_delivery_count - (required) is a type of number
  max_delivery_count = var.max_delivery_count
  # name - (required) is a type of string
  name = var.name
  # namespace_name - (required) is a type of string
  namespace_name = var.namespace_name
  # requires_session - (optional) is a type of bool
  requires_session = var.requires_session
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # status - (optional) is a type of string
  status = var.status
  # topic_name - (required) is a type of string
  topic_name = var.topic_name

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