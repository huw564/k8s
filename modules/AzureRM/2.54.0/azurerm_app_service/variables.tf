variable "app_service_plan_id" {
  description = "(required)"
  type        = string
}

variable "app_settings" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "client_affinity_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "client_cert_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enabled" {
  description = "(optional)"
  type        = bool
  default     = true
}

variable "https_only" {
  description = "(optional)"
  type        = bool
  default     = true
}

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

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "auth_settings" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      active_directory = list(object(
        {
          allowed_audiences = list(string)
          client_id         = string
          client_secret     = string
        }
      ))
      additional_login_params        = map(string)
      allowed_external_redirect_urls = list(string)
      default_provider               = string
      enabled                        = bool
      facebook = list(object(
        {
          app_id       = string
          app_secret   = string
          oauth_scopes = list(string)
        }
      ))
      google = list(object(
        {
          client_id     = string
          client_secret = string
          oauth_scopes  = list(string)
        }
      ))
      issuer = string
      microsoft = list(object(
        {
          client_id     = string
          client_secret = string
          oauth_scopes  = list(string)
        }
      ))
      runtime_version               = string
      token_refresh_extension_hours = number
      token_store_enabled           = bool
      twitter = list(object(
        {
          consumer_key    = string
          consumer_secret = string
        }
      ))
      unauthenticated_client_action = string
    }
  ))
  default = []
}

variable "backup" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      enabled = bool
      name    = string
      schedule = list(object(
        {
          frequency_interval       = number
          frequency_unit           = string
          keep_at_least_one_backup = bool
          retention_period_in_days = number
          start_time               = string
        }
      ))
      storage_account_url = string
    }
  ))
  default = []
}

variable "connection_string" {
  description = "nested block: NestingSet, min items: 0, max items: 0"
  type = set(object(
    {
      name  = string
      type  = string
      value = string
    }
  ))
  default = []
}

variable "identity" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      identity_ids = list(string)
      principal_id = string
      tenant_id    = string
      type         = string
    }
  ))
  default = []
}

variable "logs" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      application_logs = list(object(
        {
          azure_blob_storage = list(object(
            {
              level             = string
              retention_in_days = number
              sas_url           = string
            }
          ))
          file_system_level = string
        }
      ))
      detailed_error_messages_enabled = bool
      failed_request_tracing_enabled  = bool
      http_logs = list(object(
        {
          azure_blob_storage = list(object(
            {
              retention_in_days = number
              sas_url           = string
            }
          ))
          file_system = list(object(
            {
              retention_in_days = number
              retention_in_mb   = number
            }
          ))
        }
      ))
    }
  ))
  default = []
}

variable "site_config" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      always_on           = bool
      app_command_line    = string
      auto_swap_slot_name = string
      cors = list(object(
        {
          allowed_origins     = set(string)
          support_credentials = bool
        }
      ))
      default_documents        = list(string)
      dotnet_framework_version = string
      ftps_state               = string
      health_check_path        = string
      http2_enabled            = bool
      ip_restriction = list(object(
        {
          action                    = string
          ip_address                = string
          name                      = string
          priority                  = number
          service_tag               = string
          subnet_id                 = string
          virtual_network_subnet_id = string
        }
      ))
      java_container           = string
      java_container_version   = string
      java_version             = string
      linux_fx_version         = string
      local_mysql_enabled      = bool
      managed_pipeline_mode    = string
      min_tls_version          = string
      number_of_workers        = number
      php_version              = string
      python_version           = string
      remote_debugging_enabled = bool
      remote_debugging_version = string
      scm_ip_restriction = list(object(
        {
          action                    = string
          ip_address                = string
          name                      = string
          priority                  = number
          service_tag               = string
          subnet_id                 = string
          virtual_network_subnet_id = string
        }
      ))
      scm_type                    = string
      scm_use_main_ip_restriction = bool
      use_32_bit_worker_process   = bool
      websockets_enabled          = bool
      windows_fx_version          = string
    }
  ))
  default = []
}

variable "source_control" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      branch             = string
      manual_integration = bool
      repo_url           = string
      rollback_enabled   = bool
      use_mercurial      = bool
    }
  ))
  default = []
}

variable "storage_account" {
  description = "nested block: NestingSet, min items: 0, max items: 0"
  type = set(object(
    {
      access_key   = string
      account_name = string
      mount_path   = string
      name         = string
      share_name   = string
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
variable "diagnostic_setting_existing_resource_id" {default = "__shared-log-analytics-workspace-id__"}
variable "diagnostic_setting_AppServiceHTTPLogs_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceHTTPLogs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceHTTPLogs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AppServiceConsoleLogs_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceConsoleLogs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceConsoleLogs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AppServiceAppLogs_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceAppLogs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceAppLogs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AppServiceFileAuditLogs_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceFileAuditLogs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceFileAuditLogs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AppServiceAuditLogs_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceAuditLogs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceAuditLogs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AppServiceIPSecAuditLogs_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceIPSecAuditLogs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceIPSecAuditLogs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AppServicePlatformLogs_enabled" {default = "true"}
variable "diagnostic_setting_AppServicePlatformLogs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AppServicePlatformLogs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AppServiceAntivirusScanAuditLogs_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceAntivirusScanAuditLogs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_AppServiceAntivirusScanAuditLogs_retention_policy_days" {default = "0"}
variable "metric_category" {default ="AllMetrics"}
variable "diagnostic_setting_metric_enabled" {default = "true"}
variable "diagnostic_setting_metric_retention_policy_enabled" {default = "true"}