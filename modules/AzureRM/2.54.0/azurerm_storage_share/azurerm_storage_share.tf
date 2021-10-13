resource "azurerm_storage_share" "this" {
  # metadata - (optional) is a type of map of string
  metadata = var.metadata
  # name - (required) is a type of string
  name = var.name
  # quota - (optional) is a type of number
  quota = var.quota
  # storage_account_name - (required) is a type of string
  storage_account_name = var.storage_account_name

  dynamic "acl" {
    for_each = var.acl
    content {
      # id - (required) is a type of string
      id = acl.value["id"]

      dynamic "access_policy" {
        for_each = acl.value.access_policy
        content {
          # expiry - (optional) is a type of string
          expiry = access_policy.value["expiry"]
          # permissions - (required) is a type of string
          permissions = access_policy.value["permissions"]
          # start - (optional) is a type of string
          start = access_policy.value["start"]
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