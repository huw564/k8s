variable "location" {
  description = "(required)"
  type        = string
}

variable "managed_resource_group_name" {
  description = "(optional)"
  type        = string
  default     = null
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

variable "custom_parameters" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      no_public_ip        = bool
      private_subnet_name = string
      public_subnet_name  = string
      virtual_network_id  = string
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
variable "diagnostic_setting_dbfs_enabled" {default = "true"}
variable "diagnostic_setting_dbfs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_dbfs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_clusters_enabled" {default = "true"}
variable "diagnostic_setting_clusters_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_clusters_retention_policy_days" {default = "0"}
variable "diagnostic_setting_accounts_enabled" {default = "true"}
variable "diagnostic_setting_accounts_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_accounts_retention_policy_days" {default = "0"}
variable "diagnostic_setting_jobs_enabled" {default = "true"}
variable "diagnostic_setting_jobs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_jobs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_notebook_enabled" {default = "true"}
variable "diagnostic_setting_notebook_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_notebook_retention_policy_days" {default = "0"}
variable "diagnostic_setting_ssh_enabled" {default = "true"} 
variable "diagnostic_setting_ssh_retention_policy_enabled" {default = "true"} 
variable "diagnostic_setting_ssh_retention_policy_days" {default = "0"}
variable "diagnostic_setting_workspace_enabled" {default = "true"}
variable "diagnostic_setting_workspace_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_workspace_retention_policy_days" {default = "0"}
variable "diagnostic_setting_secrets_enabled" {default = "true"}
variable "diagnostic_setting_secrets_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_secrets_retention_policy_days" {default = "0"}
variable "diagnostic_setting_sqlPermissions_enabled" {default = "true"}
variable "diagnostic_setting_sqlPermissions_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_sqlPermissions_retention_policy_days" {default = "0"}
variable "diagnostic_setting_instancePools_enabled" {default = "true"}
variable "diagnostic_setting_instancePools_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_instancePools_retention_policy_days" {default = "0"}