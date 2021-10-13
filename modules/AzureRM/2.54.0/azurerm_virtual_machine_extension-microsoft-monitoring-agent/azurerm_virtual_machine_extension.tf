resource "azurerm_virtual_machine_extension" "this" {
  name                  = var.name
  virtual_machine_id    = var.virtual_machine_id
  publisher             = var.publisher
  type                  = var.type
  type_handler_version  = var.type_handler_version

  settings = <<SETTINGS
        {
          "workspaceId": "${var.workspace_id}"
        }
SETTINGS
   protected_settings = <<PROTECTED_SETTINGS
        {
          "workspaceKey": "${var.workspace_key}"
        }
PROTECTED_SETTINGS
}

output "id" { 
  value = azurerm_virtual_machine_extension.this.id
}