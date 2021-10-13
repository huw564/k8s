resource "azurerm_databricks_workspace" "this" {
  # location - (required) is a type of string
  location = var.location
  # managed_resource_group_name - (optional) is a type of string
  managed_resource_group_name = var.managed_resource_group_name
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # sku - (required) is a type of string
  sku = var.sku
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "custom_parameters" {
    for_each = var.custom_parameters
    content {
      # no_public_ip - (optional) is a type of bool
      no_public_ip = custom_parameters.value["no_public_ip"]
      # private_subnet_name - (optional) is a type of string
      private_subnet_name = custom_parameters.value["private_subnet_name"]
      # public_subnet_name - (optional) is a type of string
      public_subnet_name = custom_parameters.value["public_subnet_name"]
      # virtual_network_id - (optional) is a type of string
      virtual_network_id = custom_parameters.value["virtual_network_id"]
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

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name                       = var.diagnostic_setting_name
  target_resource_id         = var.diagnostic_setting_target_resource_id
  log_analytics_workspace_id = var.diagnostic_setting_existing_resource_id


log {
    category = "dbfs"
    enabled  = var.diagnostic_setting_dbfs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_dbfs_retention_policy_enabled
      days = var.diagnostic_setting_dbfs_retention_policy_days
    }
  }
    log {
    category = "clusters"
    enabled  = var.diagnostic_setting_clusters_enabled
    retention_policy {
      enabled = var.diagnostic_setting_clusters_retention_policy_enabled
      days = var.diagnostic_setting_clusters_retention_policy_days
    }
  }
    log {
    category = "accounts"
    enabled  = var.diagnostic_setting_accounts_enabled
    retention_policy {
      enabled = var.diagnostic_setting_accounts_retention_policy_enabled
      days = var.diagnostic_setting_accounts_retention_policy_days
    }
    }
   log {
    category = "jobs"
    enabled  = var.diagnostic_setting_jobs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_jobs_retention_policy_enabled
      days = var.diagnostic_setting_jobs_retention_policy_days
    }
   }
   log {
    category = "notebook"
    enabled  = var.diagnostic_setting_notebook_enabled
    retention_policy {
      enabled = var.diagnostic_setting_notebook_retention_policy_enabled
      days = var.diagnostic_setting_notebook_retention_policy_days
    }
   }
   log {
    category = "ssh"
    enabled  = var.diagnostic_setting_ssh_enabled
    retention_policy {
      enabled = var.diagnostic_setting_ssh_retention_policy_enabled
      days = var.diagnostic_setting_ssh_retention_policy_days
    }
   }
       log {
    category = "workspace"
    enabled  = var.diagnostic_setting_workspace_enabled
    retention_policy {
      enabled = var.diagnostic_setting_workspace_retention_policy_enabled
      days = var.diagnostic_setting_workspace_retention_policy_days
    }
  }

    log {
    category = "secrets"
    enabled  = var.diagnostic_setting_secrets_enabled
    retention_policy {
      enabled = var.diagnostic_setting_secrets_retention_policy_enabled
      days = var.diagnostic_setting_secrets_retention_policy_days
    }
  }

    log {
    category = "sqlPermissions"
    enabled  = var.diagnostic_setting_sqlPermissions_enabled
    retention_policy {
      enabled = var.diagnostic_setting_sqlPermissions_retention_policy_enabled
      days = var.diagnostic_setting_sqlPermissions_retention_policy_days
    }
  }

    log {
    category = "instancePools"
    enabled  = var.diagnostic_setting_instancePools_enabled
    retention_policy {
      enabled = var.diagnostic_setting_instancePools_retention_policy_enabled
      days = var.diagnostic_setting_instancePools_retention_policy_days
    }
  }
}