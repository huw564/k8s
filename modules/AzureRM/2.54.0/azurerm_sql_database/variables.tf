variable "collation" {
  description = "(optional)"
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "create_mode" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "edition" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "elastic_pool_name" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "extended_auditing_policy" {
  description = "(optional)"
  type = list(object(
    {
      log_monitoring_enabled                  = bool
      retention_in_days                       = number
      storage_account_access_key              = string
      storage_account_access_key_is_secondary = bool
      storage_endpoint                        = string
    }
  ))
  default = null
}

variable "location" {
  description = "(required)"
  type        = string
}

variable "max_size_bytes" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "max_size_gb" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "read_scale" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "requested_service_objective_id" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "requested_service_objective_name" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "(required)"
  type        = string
}

variable "restore_point_in_time" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "server_name" {
  description = "(required)"
  type        = string
}

variable "source_database_deletion_date" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "source_database_id" {
  description = "(optional)"
  type        = string
  default     = null
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

variable "import" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      administrator_login          = string
      administrator_login_password = string
      authentication_type          = string
      operation_mode               = string
      storage_key                  = string
      storage_key_type             = string
      storage_uri                  = string
    }
  ))
  default = []
}

variable "threat_detection_policy" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      disabled_alerts            = set(string)
      email_account_admins       = string
      email_addresses            = set(string)
      retention_days             = number
      state                      = string
      storage_account_access_key = string
      storage_endpoint           = string
      use_server_default         = string
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

variable "diagnostic_setting_name" {}
variable "diagnostic_setting_target_resource_id" {}
variable "diagnostic_setting_existing_resource_id" {default = "__shared-log-analytics-workspace-id__"}
variable "diagnostic_setting_SQLInsights_enabled" {default = "true"}
variable "diagnostic_setting_SQLInsights_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_SQLInsights_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AutomaticTuning_enabled" {default = "true"}
variable "diagnostic_setting_AutomaticTuning_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AutomaticTuning_retention_policy_days" {default = "0"}
variable "diagnostic_setting_QueryStoreRuntimeStatistics_enabled" {default = "true"}
variable "diagnostic_setting_QueryStoreRuntimeStatistics_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_QueryStoreRuntimeStatistics_retention_policy_days" {default = "0"}
variable "diagnostic_setting_QueryStoreWaitStatistics_enabled" {default = "true"}
variable "diagnostic_setting_QueryStoreWaitStatistics_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_QueryStoreWaitStatistics_retention_policy_days" {default = "0"}
variable "diagnostic_setting_Errors_enabled" {default = "true"}
variable "diagnostic_setting_Errors_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_Errors_retention_policy_days" {default = "0"}
variable "diagnostic_setting_DatabaseWaitStatistics_enabled" {default = "true"}
variable "diagnostic_setting_DatabaseWaitStatistics_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_DatabaseWaitStatistics_retention_policy_days" {default = "0"}
variable "diagnostic_setting_Timeouts_enabled" {default = "true"}
variable "diagnostic_setting_Timeouts_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_Timeouts_retention_policy_days" {default = "0"}
variable "diagnostic_setting_Blocks_enabled" {default = "true"}
variable "diagnostic_setting_Blocks_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_Blocks_retention_policy_days" {default = "0"}
variable "diagnostic_setting_Deadlocks_enabled" {default = "true"}
variable "diagnostic_setting_Deadlocks_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_Deadlocks_retention_policy_days" {default = "0"}
variable "diagnostic_setting_Basic_enabled" {default = "true"}
variable "diagnostic_setting_Basic_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_InstanceAndAppAdvanced_enabled" {default = "true"}
variable "diagnostic_setting_InstanceAndAppAdvanced_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_WorkloadManagement_enabled" {default = "true"}
variable "diagnostic_setting_WorkloadManagement_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_DevOpsOperationsAudit_enabled" {default = "true"}
variable "diagnostic_setting_DevOpsOperationsAudit_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_DevOpsOperationsAudit_retention_policy_days" {default = "0"}
variable "diagnostic_setting_SQLSecurityAuditEvents_enabled" {default = "true"}
variable "diagnostic_setting_SQLSecurityAuditEvents_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_SQLSecurityAuditEvents_retention_policy_days" {default = "0"}