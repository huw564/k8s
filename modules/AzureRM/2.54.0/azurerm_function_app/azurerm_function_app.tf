resource "azurerm_function_app" "this" {
  # app_service_plan_id - (required) is a type of string
  app_service_plan_id = var.app_service_plan_id
  # app_settings - (optional) is a type of map of string
  app_settings = var.app_settings
  # client_affinity_enabled - (optional) is a type of bool
  client_affinity_enabled = var.client_affinity_enabled
  # daily_memory_time_quota - (optional) is a type of number
  daily_memory_time_quota = var.daily_memory_time_quota
  # enable_builtin_logging - (optional) is a type of bool
  enable_builtin_logging = var.enable_builtin_logging
  # enabled - (optional) is a type of bool
  enabled = var.enabled
  # https_only - (optional) is a type of bool
  https_only = var.https_only
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # os_type - (optional) is a type of string
  os_type = var.os_type
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # storage_account_access_key - (optional) is a type of string
  storage_account_access_key = var.storage_account_access_key
  # storage_account_name - (optional) is a type of string
  storage_account_name = var.storage_account_name
  # tags - (optional) is a type of map of string
  tags = var.tags
  # version - (optional) is a type of string
  version = var.app_version

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

  dynamic "site_config" {
    for_each = var.site_config
    content {
      # always_on - (optional) is a type of bool
      always_on = site_config.value["always_on"]
      # auto_swap_slot_name - (optional) is a type of string
      auto_swap_slot_name = site_config.value["auto_swap_slot_name"]
      # ftps_state - (optional) is a type of string
      ftps_state = site_config.value["ftps_state"]
      # health_check_path - (optional) is a type of string
      health_check_path = site_config.value["health_check_path"]
      # http2_enabled - (optional) is a type of bool
      http2_enabled = site_config.value["http2_enabled"]
      # ip_restriction - (optional) is a type of list of object
      ip_restriction = site_config.value["ip_restriction"]
      # linux_fx_version - (optional) is a type of string
      linux_fx_version = site_config.value["linux_fx_version"]
      # min_tls_version - (optional) is a type of string
      min_tls_version = site_config.value["min_tls_version"]
      # pre_warmed_instance_count - (optional) is a type of number
      pre_warmed_instance_count = site_config.value["pre_warmed_instance_count"]
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
    category = "FunctionAppLogs"
    enabled  = var.diagnostic_setting_FunctionAppLogs_enabled
    retention_policy {
      enabled = var.diagnostic_setting_FunctionAppLogs_retention_policy_enabled
      days = var.diagnostic_setting_FunctionAppLogs_retention_policy_days
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