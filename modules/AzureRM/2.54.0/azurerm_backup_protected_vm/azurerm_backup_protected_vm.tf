resource "azurerm_backup_protected_vm" "this" {
  # backup_policy_id - (required) is a type of string
  backup_policy_id = var.backup_policy_id
  # recovery_vault_name - (required) is a type of string
  recovery_vault_name = var.recovery_vault_name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # source_vm_id - (required) is a type of string
  source_vm_id = var.source_vm_id
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