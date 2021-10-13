resource "azurerm_app_service" "this" {
  # app_service_plan_id - (required) is a type of string
  app_service_plan_id = var.app_service_plan_id
  # app_settings - (optional) is a type of map of string
  app_settings = var.app_settings
  # client_affinity_enabled - (optional) is a type of bool
  client_affinity_enabled = var.client_affinity_enabled
  # client_cert_enabled - (optional) is a type of bool
  client_cert_enabled = var.client_cert_enabled
  # enabled - (optional) is a type of bool
  enabled = var.enabled
  # https_only - (optional) is a type of bool
  https_only = var.https_only
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "auth_settings" {
    for_each = var.auth_settings
    content {
      # additional_login_params - (optional) is a type of map of string
      additional_login_params = auth_settings.value["additional_login_params"]
      # allowed_external_redirect_urls - (optional) is a type of list of string
      allowed_external_redirect_urls = auth_settings.value["allowed_external_redirect_urls"]
      # default_provider - (optional) is a type of string
      default_provider = auth_settings.value["default_provider"]
      # enabled - (required) is a type of bool
      enabled = auth_settings.value["enabled"]
      # issuer - (optional) is a type of string
      issuer = auth_settings.value["issuer"]
      # runtime_version - (optional) is a type of string
      runtime_version = auth_settings.value["runtime_version"]
      # token_refresh_extension_hours - (optional) is a type of number
      token_refresh_extension_hours = auth_settings.value["token_refresh_extension_hours"]
      # token_store_enabled - (optional) is a type of bool
      token_store_enabled = auth_settings.value["token_store_enabled"]
      # unauthenticated_client_action - (optional) is a type of string
      unauthenticated_client_action = auth_settings.value["unauthenticated_client_action"]

      dynamic "active_directory" {
        for_each = auth_settings.value.active_directory
        content {
          # allowed_audiences - (optional) is a type of list of string
          allowed_audiences = active_directory.value["allowed_audiences"]
          # client_id - (required) is a type of string
          client_id = active_directory.value["client_id"]
          # client_secret - (optional) is a type of string
          client_secret = active_directory.value["client_secret"]
        }
      }

      dynamic "facebook" {
        for_each = auth_settings.value.facebook
        content {
          # app_id - (required) is a type of string
          app_id = facebook.value["app_id"]
          # app_secret - (required) is a type of string
          app_secret = facebook.value["app_secret"]
          # oauth_scopes - (optional) is a type of list of string
          oauth_scopes = facebook.value["oauth_scopes"]
        }
      }

      dynamic "google" {
        for_each = auth_settings.value.google
        content {
          # client_id - (required) is a type of string
          client_id = google.value["client_id"]
          # client_secret - (required) is a type of string
          client_secret = google.value["client_secret"]
          # oauth_scopes - (optional) is a type of list of string
          oauth_scopes = google.value["oauth_scopes"]
        }
      }

      dynamic "microsoft" {
        for_each = auth_settings.value.microsoft
        content {
          # client_id - (required) is a type of string
          client_id = microsoft.value["client_id"]
          # client_secret - (required) is a type of string
          client_secret = microsoft.value["client_secret"]
          # oauth_scopes - (optional) is a type of list of string
          oauth_scopes = microsoft.value["oauth_scopes"]
        }
      }

      dynamic "twitter" {
        for_each = auth_settings.value.twitter
        content {
          # consumer_key - (required) is a type of string
          consumer_key = twitter.value["consumer_key"]
          # consumer_secret - (required) is a type of string
          consumer_secret = twitter.value["consumer_secret"]
        }
      }

    }
  }

  dynamic "backup" {
    for_each = var.backup
    content {
      # enabled - (optional) is a type of bool
      enabled = backup.value["enabled"]
      # name - (required) is a type of string
      name = backup.value["name"]
      # storage_account_url - (required) is a type of string
      storage_account_url = backup.value["storage_account_url"]

      dynamic "schedule" {
        for_each = backup.value.schedule
        content {
          # frequency_interval - (required) is a type of number
          frequency_interval = schedule.value["frequency_interval"]
          # frequency_unit - (required) is a type of string
          frequency_unit = schedule.value["frequency_unit"]
          # keep_at_least_one_backup - (optional) is a type of bool
          keep_at_least_one_backup = schedule.value["keep_at_least_one_backup"]
          # retention_period_in_days - (optional) is a type of number
          retention_period_in_days = schedule.value["retention_period_in_days"]
          # start_time - (optional) is a type of string
          start_time = schedule.value["start_time"]
        }
      }

    }
  }

  dynamic "connection_string" {
    for_each = var.connection_string
    content {
      # name - (required) is a type of string
      name = connection_string.value["name"]
      # type - (required) is a type of string
      type = connection_string.value["type"]
      # value - (required) is a type of string
      value = connection_string.value["value"]
    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      # identity_ids - (optional) is a type of list of string
      identity_ids = identity.value["identity_ids"]
      # type - (required) is a type of string
      type = identity.value["type"]
    }
  }

  dynamic "logs" {
    for_each = var.logs
    content {
      # detailed_error_messages_enabled - (optional) is a type of bool
      detailed_error_messages_enabled = logs.value["detailed_error_messages_enabled"]
      # failed_request_tracing_enabled - (optional) is a type of bool
      failed_request_tracing_enabled = logs.value["failed_request_tracing_enabled"]

      dynamic "application_logs" {
        for_each = logs.value.application_logs
        content {
          # file_system_level - (optional) is a type of string
          file_system_level = application_logs.value["file_system_level"]

          dynamic "azure_blob_storage" {
            for_each = application_logs.value.azure_blob_storage
            content {
              # level - (required) is a type of string
              level = azure_blob_storage.value["level"]
              # retention_in_days - (required) is a type of number
              retention_in_days = azure_blob_storage.value["retention_in_days"]
              # sas_url - (required) is a type of string
              sas_url = azure_blob_storage.value["sas_url"]
            }
          }

        }
      }

      dynamic "http_logs" {
        for_each = logs.value.http_logs
        content {

          dynamic "azure_blob_storage" {
            for_each = http_logs.value.azure_blob_storage
            content {
              # retention_in_days - (required) is a type of number
              retention_in_days = azure_blob_storage.value["retention_in_days"]
              # sas_url - (required) is a type of string
              sas_url = azure_blob_storage.value["sas_url"]
            }
          }

          dynamic "file_system" {
            for_each = http_logs.value.file_system
            content {
              # retention_in_days - (required) is a type of number
              retention_in_days = file_system.value["retention_in_days"]
              # retention_in_mb - (required) is a type of number
              retention_in_mb = file_system.value["retention_in_mb"]
            }
          }

        }
      }

    }
  }

  dynamic "site_config" {
    for_each = var.site_config
    content {
      # always_on - (optional) is a type of bool
      always_on = site_config.value["always_on"]
      # app_command_line - (optional) is a type of string
      app_command_line = site_config.value["app_command_line"]
      # auto_swap_slot_name - (optional) is a type of string
      auto_swap_slot_name = site_config.value["auto_swap_slot_name"]
      # default_documents - (optional) is a type of list of string
      default_documents = site_config.value["default_documents"]
      # dotnet_framework_version - (optional) is a type of string
      dotnet_framework_version = site_config.value["dotnet_framework_version"]
      # ftps_state - (optional) is a type of string
      ftps_state = site_config.value["ftps_state"]
      # health_check_path - (optional) is a type of string
      health_check_path = site_config.value["health_check_path"]
      # http2_enabled - (optional) is a type of bool
      http2_enabled = site_config.value["http2_enabled"]
      # ip_restriction - (optional) is a type of list of object
      ip_restriction = site_config.value["ip_restriction"]
      # java_container - (optional) is a type of string
      java_container = site_config.value["java_container"]
      # java_container_version - (optional) is a type of string
      java_container_version = site_config.value["java_container_version"]
      # java_version - (optional) is a type of string
      java_version = site_config.value["java_version"]
      # linux_fx_version - (optional) is a type of string
      linux_fx_version = site_config.value["linux_fx_version"]
      # local_mysql_enabled - (optional) is a type of bool
      local_mysql_enabled = site_config.value["local_mysql_enabled"]
      # managed_pipeline_mode - (optional) is a type of string
      managed_pipeline_mode = site_config.value["managed_pipeline_mode"]
      # min_tls_version - (optional) is a type of string
      min_tls_version = site_config.value["min_tls_version"]
      # number_of_workers - (optional) is a type of number
      number_of_workers = site_config.value["number_of_workers"]
      # php_version - (optional) is a type of string
      php_version = site_config.value["php_version"]
      # python_version - (optional) is a type of string
      python_version = site_config.value["python_version"]
      # remote_debugging_enabled - (optional) is a type of bool
      remote_debugging_enabled = site_config.value["remote_debugging_enabled"]
      # remote_debugging_version - (optional) is a type of string
      remote_debugging_version = site_config.value["remote_debugging_version"]
      # scm_ip_restriction - (optional) is a type of list of object
      scm_ip_restriction = site_config.value["scm_ip_restriction"]
      # scm_type - (optional) is a type of string
      scm_type = site_config.value["scm_type"]
      # scm_use_main_ip_restriction - (optional) is a type of bool
      scm_use_main_ip_restriction = site_config.value["scm_use_main_ip_restriction"]
      # use_32_bit_worker_process - (optional) is a type of bool
      use_32_bit_worker_process = site_config.value["use_32_bit_worker_process"]
      # websockets_enabled - (optional) is a type of bool
      websockets_enabled = site_config.value["websockets_enabled"]
      # windows_fx_version - (optional) is a type of string
      windows_fx_version = site_config.value["windows_fx_version"]

      dynamic "cors" {
        for_each = site_config.value.cors
        content {
          # allowed_origins - (required) is a type of set of string
          allowed_origins = cors.value["allowed_origins"]
          # support_credentials - (optional) is a type of bool
          support_credentials = cors.value["support_credentials"]
        }
      }

    }
  }

  dynamic "source_control" {
    for_each = var.source_control
    content {
      # branch - (optional) is a type of string
      branch = source_control.value["branch"]
      # manual_integration - (optional) is a type of bool
      manual_integration = source_control.value["manual_integration"]
      # repo_url - (optional) is a type of string
      repo_url = source_control.value["repo_url"]
      # rollback_enabled - (optional) is a type of bool
      rollback_enabled = source_control.value["rollback_enabled"]
      # use_mercurial - (optional) is a type of bool
      use_mercurial = source_control.value["use_mercurial"]
    }
  }

  dynamic "storage_account" {
    for_each = var.storage_account
    content {
      # access_key - (required) is a type of string
      access_key = storage_account.value["access_key"]
      # account_name - (required) is a type of string
      account_name = storage_account.value["account_name"]
      # mount_path - (optional) is a type of string
      mount_path = storage_account.value["mount_path"]
      # name - (required) is a type of string
      name = storage_account.value["name"]
      # share_name - (required) is a type of string
      share_name = storage_account.value["share_name"]
      # type - (required) is a type of string
      type = storage_account.value["type"]
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
  name                       = var.diagnostic_setting_name
  target_resource_id         = var.diagnostic_setting_target_resource_id
  log_analytics_workspace_id = var.diagnostic_setting_existing_resource_id

  log {
    category = "AppServiceHTTPLogs"
    enabled  = var.diagnostic_setting_AppServiceHTTPLogs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AppServiceHTTPLogs_retention_policy_enabled
      days = var.diagnostic_setting_AppServiceHTTPLogs_retention_policy_days
    }
  }

    log {
  category = "AppServiceAntivirusScanAuditLogs"
  enabled  = var.diagnostic_setting_AppServiceAntivirusScanAuditLogs_enabled
  retention_policy {
    enabled = var.diagnostic_setting_AppServiceAntivirusScanAuditLogs_retention_policy_enabled
    days = var.diagnostic_setting_AppServiceAntivirusScanAuditLogs_retention_policy_days
  }
}
    log {
    category = "AppServiceConsoleLogs"
    enabled  = var.diagnostic_setting_AppServiceConsoleLogs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AppServiceConsoleLogs_retention_policy_enabled
      days = var.diagnostic_setting_AppServiceConsoleLogs_retention_policy_days
    }
    }
    log {
    category = "AppServiceAppLogs"
    enabled  = var.diagnostic_setting_AppServiceAppLogs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AppServiceAppLogs_retention_policy_enabled
      days = var.diagnostic_setting_AppServiceAppLogs_retention_policy_days
    }
    }
   log {
    category = "AppServiceFileAuditLogs"
    enabled  = var.diagnostic_setting_AppServiceFileAuditLogs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AppServiceFileAuditLogs_retention_policy_enabled
      days = var.diagnostic_setting_AppServiceFileAuditLogs_retention_policy_days
    }
   }
   log {
    category = "AppServiceAuditLogs"
    enabled  = var.diagnostic_setting_AppServiceAuditLogs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AppServiceAuditLogs_retention_policy_enabled
      days = var.diagnostic_setting_AppServiceAuditLogs_retention_policy_days
    }
   }
   log {
    category = "AppServiceIPSecAuditLogs"
    enabled  = var.diagnostic_setting_AppServiceIPSecAuditLogs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AppServiceIPSecAuditLogs_retention_policy_enabled
      days = var.diagnostic_setting_AppServiceIPSecAuditLogs_retention_policy_days
    }
   }
       log {
    category = "AppServicePlatformLogs"
    enabled  = var.diagnostic_setting_AppServicePlatformLogs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_AppServicePlatformLogs_retention_policy_enabled
      days = var.diagnostic_setting_AppServicePlatformLogs_retention_policy_days
    }
  }

  metric {
    category = var.metric_category
    enabled = var.diagnostic_setting_metric_enabled

    retention_policy {
      enabled = var.diagnostic_setting_metric_retention_policy_enabled
    }
  }
}

