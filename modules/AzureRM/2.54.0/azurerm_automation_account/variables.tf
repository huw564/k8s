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

variable "sku_name" {
  description = "(required)"
  type        = string
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
variable "diagnostic_setting_JobLogs_enabled" {default = "true"}
variable "diagnostic_setting_JobLogs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_JobLogs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_JobStreams_enabled" {default = "true"}
variable "diagnostic_setting_JobStreams_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_JobStreams_retention_policy_days" {default = "0"}
variable "diagnostic_setting_DscNodeStatus_enabled" {default = "true"}
variable "diagnostic_setting_DscNodeStatus_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_DscNodeStatus_retention_policy_days" {default = "0"}
variable "diagnostic_setting_metric_enabled" {default = "true"}
variable "diagnostic_setting_metric_retention_policy_enabled" {default = "true"}