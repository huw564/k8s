resource "azurerm_virtual_machine_data_disk_attachment" "this" {
  # caching - (required) is a type of string
  caching = var.caching
  # create_option - (optional) is a type of string
  create_option = var.create_option
  # lun - (required) is a type of number
  lun = var.lun
  # managed_disk_id - (required) is a type of string
  managed_disk_id = var.managed_disk_id
  # virtual_machine_id - (required) is a type of string
  virtual_machine_id = var.virtual_machine_id
  # write_accelerator_enabled - (optional) is a type of bool
  write_accelerator_enabled = var.write_accelerator_enabled

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