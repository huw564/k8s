module "azurerm_network_security_group" {
  source = "./modules/azurerm/r/azurerm_network_security_group"

  # location - (required) is a type of string
  location = null
  # name - (required) is a type of string
  name = null
  # resource_group_name - (required) is a type of string
  resource_group_name = null
  # security_rule - (optional) is a type of set of object
  security_rule = [{
    access                                     = null
    description                                = null
    destination_address_prefix                 = null
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = null
    destination_port_ranges                    = []
    direction                                  = null
    name                                       = null
    priority                                   = null
    protocol                                   = null
    source_address_prefix                      = null
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = null
    source_port_ranges                         = []
  }]
  # tags - (optional) is a type of map of string
  tags = {}

  timeouts = [{
    create = null
    delete = null
    read   = null
    update = null
  }]
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name                       = var.diagnostic_setting_name
  target_resource_id         = var.diagnostic_setting_target_resource_id
  log_analytics_workspace_id = var.diagnostic_setting_existing_resource_id
 
      log {
    category = "NetworkSecurityGroupRuleCounter"
    enabled  = var.diagnostic_setting_NetworkSecurityGroupRuleCounter_enabled
    retention_policy {
      enabled = var.diagnostic_setting_NetworkSecurityGroupRuleCounter_retention_policy_enabled
      days = var.diagnostic_setting_NetworkSecurityGroupRuleCounter_retention_policy_days
    }
  }
 
       log {
    category = "NetworkSecurityGroupEvent"
    enabled  = var.diagnostic_setting_NetworkSecurityGroupEvent_enabled
    retention_policy {
      enabled = var.diagnostic_setting_NetworkSecurityGroupEvent_retention_policy_enabled
      days = var.diagnostic_setting_NetworkSecurityGroupEvent_retention_policy_days
    }
  }
  
 
 }