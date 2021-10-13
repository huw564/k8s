resource "azurerm_key_vault_access_policy" "this" {
  # application_id - (optional) is a type of string
  application_id = var.application_id
  # certificate_permissions - (optional) is a type of list of string
  certificate_permissions = var.certificate_permissions
  # key_permissions - (optional) is a type of list of string
  key_permissions = var.key_permissions
  # key_vault_id - (required) is a type of string
  key_vault_id = var.key_vault_id
  # object_id - (required) is a type of string
  object_id = var.object_id
  # secret_permissions - (optional) is a type of list of string
  secret_permissions = var.secret_permissions
  # storage_permissions - (optional) is a type of list of string
  storage_permissions = var.storage_permissions
  # tenant_id - (required) is a type of string
  tenant_id = var.tenant_id

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