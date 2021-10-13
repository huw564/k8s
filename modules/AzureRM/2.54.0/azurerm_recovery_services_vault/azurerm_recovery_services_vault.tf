resource "azurerm_recovery_services_vault" "this" {
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # sku - (required) is a type of string
  sku = var.sku
  # soft_delete_enabled - (optional) is a type of bool
  soft_delete_enabled = var.soft_delete_enabled
  # tags - (optional) is a type of map of string
  tags = var.tags

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

}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                               = var.diagnostic_setting_name
  target_resource_id                 = var.diagnostic_setting_target_resource_id
  log_analytics_workspace_id         = var.diagnostic_setting_existing_resource_id
  log_analytics_destination_type     = "Dedicated"
log {
    category = "AzureBackupReport"
    enabled  = var.diagnostic_setting_AzureBackupReport_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AzureBackupReport_retention_policy_enabled
      days = var.diagnostic_setting_AzureBackupReport_retention_policy_days
    }
  }
  
    log {
    category = "CoreAzureBackup"
    enabled  = var.diagnostic_setting_CoreAzureBackup_enabled
    retention_policy {
      enabled = var.diagnostic_setting_CoreAzureBackup_retention_policy_enabled
      days = var.diagnostic_setting_CoreAzureBackup_retention_policy_days
    }
  }
  
    log {
    category = "AddonAzureBackupJobs"
    enabled  = var.diagnostic_setting_AddonAzureBackupJobs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AddonAzureBackupJobs_retention_policy_enabled
      days = var.diagnostic_setting_AddonAzureBackupJobs_retention_policy_days
    }
  }
  
    log {
    category = "AddonAzureBackupAlerts"
    enabled  = var.diagnostic_setting_AddonAzureBackupAlerts_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AddonAzureBackupAlerts_retention_policy_enabled
      days = var.diagnostic_setting_AddonAzureBackupAlerts_retention_policy_days
    }
  }
  
    log {
    category = "AddonAzureBackupPolicy"
    enabled  = var.diagnostic_setting_AddonAzureBackupPolicy_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AddonAzureBackupPolicy_retention_policy_enabled
      days = var.diagnostic_setting_AddonAzureBackupPolicy_retention_policy_days
    }
  }
  
    log {
    category = "AddonAzureBackupStorage"
    enabled  = var.diagnostic_setting_AddonAzureBackupStorage_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AddonAzureBackupStorage_retention_policy_enabled
      days = var.diagnostic_setting_AddonAzureBackupStorage_retention_policy_days
    }
  }
  
    log {
    category = "AddonAzureBackupProtectedInstance"
    enabled  = var.diagnostic_setting_AddonAzureBackupProtectedInstance_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AddonAzureBackupProtectedInstance_retention_policy_enabled
      days = var.diagnostic_setting_AddonAzureBackupProtectedInstance_retention_policy_days
    }
  }
  
    log {
    category = "AzureSiteRecoveryJobs"
    enabled  = var.diagnostic_setting_AzureSiteRecoveryJobs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AzureSiteRecoveryJobs_retention_policy_enabled
      days = var.diagnostic_setting_AzureSiteRecoveryJobs_retention_policy_days
    }
  }
  
    log {
    category = "AzureSiteRecoveryEvents"
    enabled  = var.diagnostic_setting_AzureSiteRecoveryEvents_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AzureSiteRecoveryEvents_retention_policy_enabled
      days = var.diagnostic_setting_AzureSiteRecoveryEvents_retention_policy_days
    }
  }
  
    log {
    category = "AzureSiteRecoveryReplicatedItems"
    enabled  = var.diagnostic_setting_AzureSiteRecoveryReplicatedItems_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AzureSiteRecoveryReplicatedItems_retention_policy_enabled
      days = var.diagnostic_setting_AzureSiteRecoveryReplicatedItems_retention_policy_days
    }
  }
  
    log {
    category = "AzureSiteRecoveryReplicationStats"
    enabled  = var.diagnostic_setting_AzureSiteRecoveryReplicationStats_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AzureSiteRecoveryReplicationStats_retention_policy_enabled
      days = var.diagnostic_setting_AzureSiteRecoveryReplicationStats_retention_policy_days
    }
  }
  
    log {
    category = "AzureSiteRecoveryRecoveryPoints"
    enabled  = var.diagnostic_setting_AzureSiteRecoveryRecoveryPoints_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AzureSiteRecoveryRecoveryPoints_retention_policy_enabled
      days = var.diagnostic_setting_AzureSiteRecoveryRecoveryPoints_retention_policy_days
    }
  }
  
    log {
    category = "AzureSiteRecoveryReplicationDataUploadRate"
    enabled  = var.diagnostic_setting_AzureSiteRecoveryReplicationDataUploadRate_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AzureSiteRecoveryReplicationDataUploadRate_retention_policy_enabled
      days = var.diagnostic_setting_AzureSiteRecoveryReplicationDataUploadRate_retention_policy_days
    }
  }
  
    log {
    category = "AzureSiteRecoveryProtectedDiskDataChurn"
    enabled  = var.diagnostic_setting_AzureSiteRecoveryProtectedDiskDataChurn_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AzureSiteRecoveryProtectedDiskDataChurn_retention_policy_enabled
      days = var.diagnostic_setting_AzureSiteRecoveryProtectedDiskDataChurn_retention_policy_days
    }
  }

    metric {
    category = "Health"
    enabled = var.diagnostic_setting_Health_enabled

    retention_policy {
      enabled = var.diagnostic_setting_Health_retention_policy_enabled
      days = var.diagnostic_setting_Health_retention_policy_days
    }
  }
}