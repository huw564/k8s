resource "azurerm_availability_set" "this" {
  # location - (required) is a type of string
  location = var.location
  # managed - (optional) is a type of bool
  managed = var.managed
  # name - (required) is a type of string
  name = var.name
  # platform_fault_domain_count - (optional) is a type of number
  platform_fault_domain_count = var.platform_fault_domain_count
  # platform_update_domain_count - (optional) is a type of number
  platform_update_domain_count = var.platform_update_domain_count
  # proximity_placement_group_id - (optional) is a type of string
  proximity_placement_group_id = var.proximity_placement_group_id
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
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