resource "azurerm_managed_disk" "this" {
  # create_option - (required) is a type of string
  create_option = var.create_option
  # disk_encryption_set_id - (optional) is a type of string
  disk_encryption_set_id = var.disk_encryption_set_id
  # disk_iops_read_write - (optional) is a type of number
  disk_iops_read_write = var.disk_iops_read_write
  # disk_mbps_read_write - (optional) is a type of number
  disk_mbps_read_write = var.disk_mbps_read_write
  # disk_size_gb - (optional) is a type of number
  disk_size_gb = var.disk_size_gb
  # image_reference_id - (optional) is a type of string
  image_reference_id = var.image_reference_id
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # os_type - (optional) is a type of string
  os_type = var.os_type
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # source_resource_id - (optional) is a type of string
  source_resource_id = var.source_resource_id
  # source_uri - (optional) is a type of string
  source_uri = var.source_uri
  # storage_account_id - (optional) is a type of string
  storage_account_id = var.storage_account_id
  # storage_account_type - (required) is a type of string
  storage_account_type = var.storage_account_type
  # tags - (optional) is a type of map of string
  tags = var.tags
  # zones - (optional) is a type of list of string
  zones = var.zones

  dynamic "encryption_settings" {
    for_each = var.encryption_settings
    content {
      # enabled - (required) is a type of bool
      enabled = encryption_settings.value["enabled"]

      dynamic "disk_encryption_key" {
        for_each = encryption_settings.value.disk_encryption_key
        content {
          # secret_url - (required) is a type of string
          secret_url = disk_encryption_key.value["secret_url"]
          # source_vault_id - (required) is a type of string
          source_vault_id = disk_encryption_key.value["source_vault_id"]
        }
      }

      dynamic "key_encryption_key" {
        for_each = encryption_settings.value.key_encryption_key
        content {
          # key_url - (required) is a type of string
          key_url = key_encryption_key.value["key_url"]
          # source_vault_id - (required) is a type of string
          source_vault_id = key_encryption_key.value["source_vault_id"]
        }
      }

    }
  }

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