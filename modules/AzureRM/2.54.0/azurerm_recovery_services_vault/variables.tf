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

variable "soft_delete_enabled" {
  description = "(optional)"
  type        = bool
  default = "true"
}

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "identity" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      principal_id = string
      tenant_id    = string
      type         = string
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
variable "diagnostic_setting_existing_resource_id" {default = "__shared-log-analytics-workspace-id-casesensitive__"}
variable "diagnostic_setting_AzureBackupReport_enabled" {default = "true"}
variable "diagnostic_setting_AzureBackupReport_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AzureBackupReport_retention_policy_days" {default = "0"}
variable "diagnostic_setting_CoreAzureBackup_enabled" {default = "true"}
variable "diagnostic_setting_CoreAzureBackup_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_CoreAzureBackup_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AddonAzureBackupJobs_enabled" {default = "true"}
variable "diagnostic_setting_AddonAzureBackupJobs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AddonAzureBackupJobs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AddonAzureBackupAlerts_enabled" {default = "true"}
variable "diagnostic_setting_AddonAzureBackupAlerts_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AddonAzureBackupAlerts_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AddonAzureBackupPolicy_enabled" {default = "true"}
variable "diagnostic_setting_AddonAzureBackupPolicy_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AddonAzureBackupPolicy_retention_policy_days" {default = "0"}    
variable "diagnostic_setting_AddonAzureBackupStorage_enabled" {default = "true"}
variable "diagnostic_setting_AddonAzureBackupStorage_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AddonAzureBackupStorage_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AddonAzureBackupProtectedInstance_enabled" {default = "true"}
variable "diagnostic_setting_AddonAzureBackupProtectedInstance_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AddonAzureBackupProtectedInstance_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AzureSiteRecoveryJobs_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryJobs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryJobs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AzureSiteRecoveryEvents_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryEvents_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryEvents_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AzureSiteRecoveryReplicatedItems_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryReplicatedItems_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryReplicatedItems_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AzureSiteRecoveryReplicationStats_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryReplicationStats_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryReplicationStats_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AzureSiteRecoveryRecoveryPoints_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryRecoveryPoints_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryRecoveryPoints_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AzureSiteRecoveryReplicationDataUploadRate_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryReplicationDataUploadRate_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryReplicationDataUploadRate_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AzureSiteRecoveryProtectedDiskDataChurn_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryProtectedDiskDataChurn_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AzureSiteRecoveryProtectedDiskDataChurn_retention_policy_days" {default = "0"}
variable "diagnostic_setting_Health_enabled" {default = "true"}
variable "diagnostic_setting_Health_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_Health_retention_policy_days" {default = "0"}