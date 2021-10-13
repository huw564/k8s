variable "location" {
  description = "(required)"
  type        = string
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "public_network_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "resource_group_name" {
  description = "(required)"
  type        = string
}

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "github_configuration" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      account_name    = string
      branch_name     = string
      git_url         = string
      repository_name = string
      root_folder     = string
    }
  ))
  default = []
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

variable "vsts_configuration" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      account_name    = string
      branch_name     = string
      project_name    = string
      repository_name = string
      root_folder     = string
      tenant_id       = string
    }
  ))
  default = []
}

variable "diagnostic_setting_name" {}
variable "diagnostic_setting_target_resource_id" {}
variable "diagnostic_setting_existing_resource_id" {default = "__shared-log-analytics-workspace-id__"}
variable "diagnostic_setting_ActivityRuns_enabled" {default = "true"}
variable "diagnostic_setting_ActivityRuns_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_ActivityRuns_retention_policy_days" {default = "0"}
variable "diagnostic_setting_PipelineRuns_enabled" {default = "true"}
variable "diagnostic_setting_PipelineRuns_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_PipelineRuns_retention_policy_days" {default = "0"}
variable "diagnostic_setting_TriggerRuns_enabled" {default = "true"}
variable "diagnostic_setting_TriggerRuns_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_TriggerRuns_retention_policy_days" {default = "0"}
variable "diagnostic_setting_SSISPackageEventMessages_enabled" {default = "true"}
variable "diagnostic_setting_SSISPackageEventMessages_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_SSISPackageEventMessages_retention_policy_days" {default = "0"}
variable "diagnostic_setting_SSISPackageExecutableStatistics_enabled" {default = "true"}
variable "diagnostic_setting_SSISPackageExecutableStatistics_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_SSISPackageExecutableStatistics_retention_policy_days" {default = "0"}
variable "diagnostic_setting_SSISPackageEventMessageContext_enabled" {default = "true"}
variable "diagnostic_setting_SSISPackageEventMessageContext_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_SSISPackageEventMessageContext_retention_policy_days" {default = "0"}
variable "diagnostic_setting_SSISPackageExecutionComponentPhases_enabled" {default = "true"}
variable "diagnostic_setting_SSISPackageExecutionComponentPhases_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_SSISPackageExecutionComponentPhases_retention_policy_days" {default = "0"}
variable "diagnostic_setting_SSISPackageExecutionDataStatistics_enabled" {default = "true"}
variable "diagnostic_setting_SSISPackageExecutionDataStatistics_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_SSISPackageExecutionDataStatistics_retention_policy_days" {default = "0"}
variable "diagnostic_setting_SSISIntegrationRuntimeLogs_enabled" {default = "true"}
variable "diagnostic_setting_SSISIntegrationRuntimeLogs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_SSISIntegrationRuntimeLogs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AllMetrics_enabled" {default = "true"}
variable "diagnostic_setting_AllMetrics_retention_policy_enabled" {default = "true"}
variable "log_analytics_destination_type" {default = "Dedicated"}
variable "diagnostic_setting_SandboxActivityRuns_enabled" {default = "false"}
variable "diagnostic_setting_SandboxActivityRuns_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_SandboxActivityRuns_retention_policy_days" {default = "0"}
variable "diagnostic_setting_SandboxPipelineRuns_enabled" {default = "true"}
variable "diagnostic_setting_SandboxPipelineRuns_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_SandboxPipelineRuns_retention_policy_days" {default = "0"}