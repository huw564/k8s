resource "azurerm_linux_virtual_machine" "this" {
  # admin_password - (optional) is a type of string
  admin_password = var.admin_password
  # admin_username - (required) is a type of string
  admin_username = var.admin_username
  # allow_extension_operations - (optional) is a type of bool
  allow_extension_operations = var.allow_extension_operations
  # availability_set_id - (optional) is a type of string
  availability_set_id = var.availability_set_id
  # computer_name - (optional) is a type of string
  computer_name = var.computer_name
  # custom_data - (optional) is a type of string
  custom_data = var.custom_data
  # dedicated_host_id - (optional) is a type of string
  dedicated_host_id = var.dedicated_host_id
  # disable_password_authentication - (optional) is a type of bool
  disable_password_authentication = var.disable_password_authentication
  # encryption_at_host_enabled - (optional) is a type of bool
  encryption_at_host_enabled = var.encryption_at_host_enabled
  # eviction_policy - (optional) is a type of string
  eviction_policy = var.eviction_policy
  # extensions_time_budget - (optional) is a type of string
  extensions_time_budget = var.extensions_time_budget
  # license_type - (optional) is a type of string
  license_type = var.license_type
  # location - (required) is a type of string
  location = var.location
  # max_bid_price - (optional) is a type of number
  max_bid_price = var.max_bid_price
  # name - (required) is a type of string
  name = var.name
  # network_interface_ids - (required) is a type of list of string
  network_interface_ids = var.network_interface_ids
  # platform_fault_domain - (optional) is a type of number
  platform_fault_domain = var.platform_fault_domain
  # priority - (optional) is a type of string
  priority = var.priority
  # provision_vm_agent - (optional) is a type of bool
  provision_vm_agent = var.provision_vm_agent
  # proximity_placement_group_id - (optional) is a type of string
  proximity_placement_group_id = var.proximity_placement_group_id
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # size - (required) is a type of string
  size = var.size
  # source_image_id - (optional) is a type of string
  source_image_id = var.source_image_id
  # tags - (optional) is a type of map of string
  tags = var.tags
  # virtual_machine_scale_set_id - (optional) is a type of string
  virtual_machine_scale_set_id = var.virtual_machine_scale_set_id
  # zone - (optional) is a type of string
  zone = var.zone

  dynamic "additional_capabilities" {
    for_each = var.additional_capabilities
    content {
      # ultra_ssd_enabled - (optional) is a type of bool
      ultra_ssd_enabled = additional_capabilities.value["ultra_ssd_enabled"]
    }
  }

  dynamic "admin_ssh_key" {
    for_each = var.admin_ssh_key
    content {
      # public_key - (required) is a type of string
      public_key = admin_ssh_key.value["public_key"]
      # username - (required) is a type of string
      username = admin_ssh_key.value["username"]
    }
  }

  dynamic "boot_diagnostics" {
    for_each = var.boot_diagnostics
    content {
      # storage_account_uri - (optional) is a type of string
      storage_account_uri = boot_diagnostics.value["storage_account_uri"]
    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      # identity_ids - (optional) is a type of set of string
      identity_ids = identity.value["identity_ids"]
      # type - (required) is a type of string
      type = identity.value["type"]
    }
  }

  dynamic "os_disk" {
    for_each = var.os_disk
    content {
      # caching - (required) is a type of string
      caching = os_disk.value["caching"]
      # disk_encryption_set_id - (optional) is a type of string
      disk_encryption_set_id = os_disk.value["disk_encryption_set_id"]
      # disk_size_gb - (optional) is a type of number
      disk_size_gb = os_disk.value["disk_size_gb"]
      # name - (optional) is a type of string
      name = os_disk.value["name"]
      # storage_account_type - (required) is a type of string
      storage_account_type = os_disk.value["storage_account_type"]
      # write_accelerator_enabled - (optional) is a type of bool
      write_accelerator_enabled = os_disk.value["write_accelerator_enabled"]

      dynamic "diff_disk_settings" {
        for_each = os_disk.value.diff_disk_settings
        content {
          # option - (required) is a type of string
          option = diff_disk_settings.value["option"]
        }
      }

    }
  }

  dynamic "plan" {
    for_each = var.plan
    content {
      # name - (required) is a type of string
      name = plan.value["name"]
      # product - (required) is a type of string
      product = plan.value["product"]
      # publisher - (required) is a type of string
      publisher = plan.value["publisher"]
    }
  }

  dynamic "secret" {
    for_each = var.secret
    content {
      # key_vault_id - (required) is a type of string
      key_vault_id = secret.value["key_vault_id"]

      dynamic "certificate" {
        for_each = secret.value.certificate
        content {
          # url - (required) is a type of string
          url = certificate.value["url"]
        }
      }

    }
  }

  dynamic "source_image_reference" {
    for_each = var.source_image_reference
    content {
      # offer - (required) is a type of string
      offer = source_image_reference.value["offer"]
      # publisher - (required) is a type of string
      publisher = source_image_reference.value["publisher"]
      # sku - (required) is a type of string
      sku = source_image_reference.value["sku"]
      # version - (required) is a type of string
      version = source_image_reference.value["version"]
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