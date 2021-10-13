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

variable "daily_memory_time_quota" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "enable_builtin_logging" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "https_only" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "location" {
  description = "(required)"
  type        = string
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "os_type" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "(required)"
  type        = string
}

variable "storage_account_access_key" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "storage_account_name" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "app_version" {
  description = "(optional)"
  type        = string
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

variable "site_config" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      always_on           = bool
      auto_swap_slot_name = string
      cors = list(object(
        {
          allowed_origins     = set(string)
          support_credentials = bool
        }
      ))
      ftps_state        = string
      health_check_path = string
      http2_enabled     = bool
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
      linux_fx_version          = string
      min_tls_version           = string
      pre_warmed_instance_count = number
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
variable "diagnostic_setting_FunctionAppLogs_enabled" {default = "true"}
variable "diagnostic_setting_FunctionAppLogs_retention_policy_enabled" {default = "true"}
variable "diagnostic_setting_FunctionAppLogs_retention_policy_days" {default = "0"}
variable "diagnostic_setting_AllMetrics_enabled" {default = "true"}
variable "diagnostic_setting_AllMetrics_retention_policy_enabled" {default = "true"}