resource "azurerm_advanced_threat_protection" "this" {
  # enabled - (required) is a type of bool
  enabled = var.enabled
  # target_resource_id - (required) is a type of string
  target_resource_id = var.target_resource_id

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