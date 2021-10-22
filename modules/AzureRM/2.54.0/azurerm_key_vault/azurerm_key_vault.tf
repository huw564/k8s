resource "azurerm_key_vault" "this" {
  # access_policy - (optional) is a type of list of object
  access_policy = var.access_policy
  # enable_rbac_authorization - (optional) is a type of bool
  enable_rbac_authorization = var.enable_rbac_authorization
  # enabled_for_deployment - (optional) is a type of bool
  enabled_for_deployment = var.enabled_for_deployment
  # enabled_for_disk_encryption - (optional) is a type of bool
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  # enabled_for_template_deployment - (optional) is a type of bool
  enabled_for_template_deployment = var.enabled_for_template_deployment
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # purge_protection_enabled - (optional) is a type of bool
  purge_protection_enabled = var.purge_protection_enabled
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # sku_name - (required) is a type of string
  sku_name = var.sku_name
  # soft_delete_enabled - (optional) is a type of bool
  soft_delete_enabled = var.soft_delete_enabled
  # soft_delete_retention_days - (optional) is a type of number
  soft_delete_retention_days = var.soft_delete_retention_days
  # tags - (optional) is a type of map of string
  tags = var.tags
  # tenant_id - (required) is a type of string
  tenant_id = var.tenant_id

  dynamic "contact" {
    for_each = var.contact
    content {
      # email - (required) is a type of string
      email = contact.value["email"]
      # name - (optional) is a type of string
      name = contact.value["name"]
      # phone - (optional) is a type of string
      phone = contact.value["phone"]
    }
  }

  dynamic "network_acls" {
    for_each = var.network_acls
    content {
      # bypass - (required) is a type of string
      bypass = network_acls.value["bypass"]
      # default_action - (required) is a type of string
      default_action = network_acls.value["default_action"]
      # ip_rules - (optional) is a type of set of string
      ip_rules = network_acls.value["ip_rules"]
      # virtual_network_subnet_ids - (optional) is a type of set of string
      virtual_network_subnet_ids = network_acls.value["virtual_network_subnet_ids"]
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


#resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
#  name                       = var.diagnostic_setting_name
#  target_resource_id         = var.diagnostic_setting_target_resource_id
#  log_analytics_workspace_id = var.diagnostic_setting_existing_resource_id
 
#      log {
#    category = "AuditEvent"
#    enabled  = var.diagnostic_setting_AuditEvent_enabled
#    retention_policy {
#      enabled = var.diagnostic_setting_AuditEvent_retention_policy_enabled
#      days = var.diagnostic_setting_AuditEvent_retention_policy_days
#    }
#  }
 
 #   metric {
 #   category = "AllMetrics"
 #   enabled = var.diagnostic_setting_AllMetrics_enabled
 #   retention_policy {
 #    enabled = var.diagnostic_setting_AllMetrics_retention_policy_enabled
 #   }
 # }

 #}

