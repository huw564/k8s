variable "capacity" {
  description = "(optional)"
  type        = number
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

variable "sku" {
  description = "(required)"
  type        = string
}

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "zone_redundant" {
  description = "(optional)"
  type        = bool
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
variable "diagnostic_setting_OperationalLogs_enabled"  {default = "true"}
variable "diagnostic_setting_OperationalLogs_retention_policy_enabled"  {default = "true"}
variable "diagnostic_setting_OperationalLogs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AllMetrics_enabled" {default = "true"}
variable "diagnostic_setting_AllMetrics_retention_policy_enabled"  {default = "true"}
variable "diagnostic_setting_VNetAndIPFilteringLogs_enabled" {default = "true"}
variable "diagnostic_setting_VNetAndIPFilteringLogs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_VNetAndIPFilteringLogs_retention_policy_days" {default = "0"}