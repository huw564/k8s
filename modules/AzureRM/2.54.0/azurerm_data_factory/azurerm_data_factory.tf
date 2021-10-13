resource "azurerm_data_factory" "this" {
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # public_network_enabled - (optional) is a type of bool
  public_network_enabled = var.public_network_enabled
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "github_configuration" {
    for_each = var.github_configuration
    content {
      # account_name - (required) is a type of string
      account_name = github_configuration.value["account_name"]
      # branch_name - (required) is a type of string
      branch_name = github_configuration.value["branch_name"]
      # git_url - (required) is a type of string
      git_url = github_configuration.value["git_url"]
      # repository_name - (required) is a type of string
      repository_name = github_configuration.value["repository_name"]
      # root_folder - (required) is a type of string
      root_folder = github_configuration.value["root_folder"]
    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      # type - (required) is a type of string
      type = identity.value["type"]
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

  dynamic "vsts_configuration" {
    for_each = var.vsts_configuration
    content {
      # account_name - (required) is a type of string
      account_name = vsts_configuration.value["account_name"]
      # branch_name - (required) is a type of string
      branch_name = vsts_configuration.value["branch_name"]
      # project_name - (required) is a type of string
      project_name = vsts_configuration.value["project_name"]
      # repository_name - (required) is a type of string
      repository_name = vsts_configuration.value["repository_name"]
      # root_folder - (required) is a type of string
      root_folder = vsts_configuration.value["root_folder"]
      # tenant_id - (required) is a type of string
      tenant_id = vsts_configuration.value["tenant_id"]
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name                       = var.diagnostic_setting_name
  target_resource_id         = var.diagnostic_setting_target_resource_id
  log_analytics_workspace_id = var.diagnostic_setting_existing_resource_id
  log_analytics_destination_type = var.log_analytics_destination_type

  log {
    category = "ActivityRuns"
    enabled  = var.diagnostic_setting_ActivityRuns_enabled
    retention_policy {
      enabled = var.diagnostic_setting_ActivityRuns_retention_policy_enabled
      days = var.diagnostic_setting_ActivityRuns_retention_policy_days
    }
  }
    log {
    category = "PipelineRuns"
    enabled  = var.diagnostic_setting_PipelineRuns_enabled
    retention_policy {
      enabled = var.diagnostic_setting_PipelineRuns_retention_policy_enabled
      days = var.diagnostic_setting_PipelineRuns_retention_policy_days
    }
  }
    log {
    category = "TriggerRuns"
    enabled  = var.diagnostic_setting_TriggerRuns_enabled
    retention_policy {
      enabled = var.diagnostic_setting_TriggerRuns_retention_policy_enabled
      days = var.diagnostic_setting_TriggerRuns_retention_policy_days
    }
    }
   log {
    category = "SSISPackageEventMessages"
    enabled  = var.diagnostic_setting_SSISPackageEventMessages_enabled
    retention_policy {
      enabled = var.diagnostic_setting_SSISPackageEventMessages_retention_policy_enabled
      days = var.diagnostic_setting_SSISPackageEventMessages_retention_policy_days
    }
   }
   log {
    category = "SSISPackageExecutableStatistics"
    enabled  = var.diagnostic_setting_SSISPackageExecutableStatistics_enabled
    retention_policy {
      enabled = var.diagnostic_setting_SSISPackageExecutableStatistics_retention_policy_enabled
      days = var.diagnostic_setting_SSISPackageExecutableStatistics_retention_policy_days
    }
   }
   log {
    category = "SSISPackageEventMessageContext"
    enabled  = var.diagnostic_setting_SSISPackageEventMessageContext_enabled
    retention_policy {
      enabled = var.diagnostic_setting_SSISPackageEventMessageContext_retention_policy_enabled
      days = var.diagnostic_setting_SSISPackageEventMessageContext_retention_policy_days
    }
   }
       log {
    category = "SSISPackageExecutionComponentPhases"
    enabled  = var.diagnostic_setting_SSISPackageExecutionComponentPhases_enabled
    retention_policy {
      enabled = var.diagnostic_setting_SSISPackageExecutionComponentPhases_retention_policy_enabled
      days = var.diagnostic_setting_SSISPackageExecutionComponentPhases_retention_policy_days
    }
  }

    log {
    category = "SSISPackageExecutionDataStatistics"
    enabled  = var.diagnostic_setting_SSISPackageExecutionDataStatistics_enabled
    retention_policy {
      enabled = var.diagnostic_setting_SSISPackageExecutionDataStatistics_retention_policy_enabled
      days = var.diagnostic_setting_SSISPackageExecutionDataStatistics_retention_policy_days
    }
  }

    log {
    category = "SandboxActivityRuns"
    enabled  = var.diagnostic_setting_SandboxActivityRuns_enabled
    retention_policy {
      enabled = var.diagnostic_setting_SandboxActivityRuns_retention_policy_enabled
      days = var.diagnostic_setting_SandboxActivityRuns_retention_policy_days
    }
  }

    log {
    category = "SandboxPipelineRuns"
    enabled  = var.diagnostic_setting_SandboxPipelineRuns_enabled
    retention_policy {
      enabled = var.diagnostic_setting_SandboxPipelineRuns_retention_policy_enabled
      days = var.diagnostic_setting_SandboxPipelineRuns_retention_policy_days
    }
  }

    log {
    category = "SSISIntegrationRuntimeLogs"
    enabled  = var.diagnostic_setting_SSISIntegrationRuntimeLogs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_SSISIntegrationRuntimeLogs_retention_policy_enabled
      days = var.diagnostic_setting_SSISIntegrationRuntimeLogs_retention_policy_days
    }
  }

  metric {
    category = "AllMetrics"
    enabled = var.diagnostic_setting_AllMetrics_enabled

    retention_policy {
      enabled = var.diagnostic_setting_AllMetrics_retention_policy_enabled
    }
  }
}