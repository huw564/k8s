resource "azurerm_role_assignment" "this" {
  # condition - (optional) is a type of string
  condition = var.condition
  # condition_version - (optional) is a type of string
  condition_version = var.condition_version
  # description - (optional) is a type of string
  description = var.description
  # name - (optional) is a type of string
  name = var.name
  # principal_id - (required) is a type of string
  principal_id = var.principal_id
  # role_definition_id - (optional) is a type of string
  role_definition_id = var.role_definition_id
  # role_definition_name - (optional) is a type of string
  role_definition_name = var.role_definition_name
  # scope - (required) is a type of string
  scope = var.scope
  # skip_service_principal_aad_check - (optional) is a type of bool
  skip_service_principal_aad_check = var.skip_service_principal_aad_check

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
