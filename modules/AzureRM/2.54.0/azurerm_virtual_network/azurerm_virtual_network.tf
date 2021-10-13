resource "azurerm_virtual_network" "this" {
  # address_space - (required) is a type of list of string
  address_space = var.address_space
  # bgp_community - (optional) is a type of string
  bgp_community = var.bgp_community
  # dns_servers - (optional) is a type of list of string
  dns_servers = var.dns_servers
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # subnet - (optional) is a type of set of object
  subnet = var.subnet
  # tags - (optional) is a type of map of string
  tags = var.tags
  # vm_protection_enabled - (optional) is a type of bool
  vm_protection_enabled = var.vm_protection_enabled

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan
    content {
      # enable - (required) is a type of bool
      enable = ddos_protection_plan.value["enable"]
      # id - (required) is a type of string
      id = ddos_protection_plan.value["id"]
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

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name                       = var.diagnostic_setting_name
  target_resource_id         = var.diagnostic_setting_target_resource_id
  log_analytics_workspace_id = var.diagnostic_setting_existing_resource_id

  log {
    category = "VMProtectionAlerts"
    enabled  = var.diagnostic_setting_VMProtectionAlerts_enabled
    retention_policy {
      enabled = var.diagnostic_setting_VMProtectionAlerts_retention_policy_enabled
      days = var.diagnostic_setting_VMProtectionAlerts_retention_policy_days
    }
  }
  
  metric {
    category = var.metric_category
    enabled = var.diagnostic_setting_metric_enabled

    retention_policy {
      enabled = var.diagnostic_setting_metric_retention_policy_enabled
    }
  }
}