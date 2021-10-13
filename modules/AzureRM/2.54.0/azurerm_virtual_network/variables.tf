variable "address_space" {
  description = "(required)"
  type        = list(string)
}

variable "bgp_community" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "dns_servers" {
  description = "(optional)"
  type        = list(string)
  default     = null
}

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

variable "subnet" {
  description = "(optional)"
  type = set(object(
    {
      address_prefix = string
      id             = string
      name           = string
      security_group = string
    }
  ))
  default = null
}

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "vm_protection_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "ddos_protection_plan" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      enable = bool
      id     = string
    }
  ))
  default = []
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

variable "diagnostic_setting_target_resource_id" {}
variable "diagnostic_setting_existing_resource_id" {default = "__shared-log-analytics-workspace-id__"}
variable "diagnostic_setting_VMProtectionAlerts_enabled" {default = "true"}
variable "diagnostic_setting_VMProtectionAlerts_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_VMProtectionAlerts_retention_policy_days" {default = "0"}
variable "diagnostic_setting_metric_enabled" {default = "true"}
variable "diagnostic_setting_metric_retention_policy_enabled" {default = "0"}
variable "metric_category" {default ="AllMetrics"}