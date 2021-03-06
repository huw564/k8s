variable "location" {
  description = "(required)"
  type        = string
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "resource_group_name" {
  description = "(required)"
  type        = string
}

variable "security_rule" {
  description = "(optional)"
  type = set(object(
    {
      access                                     = string
      description                                = string
      destination_address_prefix                 = string
      destination_address_prefixes               = set(string)
      destination_application_security_group_ids = set(string)
      destination_port_range                     = string
      destination_port_ranges                    = set(string)
      direction                                  = string
      name                                       = string
      priority                                   = number
      protocol                                   = string
      source_address_prefix                      = string
      source_address_prefixes                    = set(string)
      source_application_security_group_ids      = set(string)
      source_port_range                          = string
      source_port_ranges                         = set(string)
    }
  ))
  default = null
}

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "nested block: NestingSingle, min items: 0, max items: 0"
  type = set(object(
    {
      create = string
      delete = string
      read   = string
      update = string
    }
  ))
  default = []
}

variable "diagnostic_setting_name" {}
variable "diagnostic_setting_target_resource_id" {}
variable "diagnostic_setting_existing_resource_id" {default = "__shared-log-analytics-workspace-id__"}
variable "diagnostic_setting_NetworkSecurityGroupRuleCounter_enabled" {default = "true"}
variable "diagnostic_setting_NetworkSecurityGroupRuleCounter_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_NetworkSecurityGroupRuleCounter_retention_policy_days" {default = "0" }
variable "diagnostic_setting_NetworkSecurityGroupEvent_enabled" {default = "true"}
variable "diagnostic_setting_NetworkSecurityGroupEvent_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_NetworkSecurityGroupEvent_retention_policy_days" {default = "0" }