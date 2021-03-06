variable "dns_name_label" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "ip_address_type" {
  description = "(optional)"
  type        = string
  default     = "Private"
}

variable "location" {
  description = "(required)"
  type        = string
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "network_profile_id" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "os_type" {
  description = "(required)"
  type        = string
  default     = "Linux"
}

variable "resource_group_name" {
  description = "(required)"
  type        = string
}

variable "restart_policy" {
  description = "(optional)"
  type        = string
  default     = "Always"
}

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "container" {
  description = "nested block: NestingList, min items: 1, max items: 0"
  type = set(object(
    {
      commands              = list(string)
      cpu                   = number
      environment_variables = map(string)
      gpu = list(object(
        {
          count = number
          sku   = string
        }
      ))
      image = string
      liveness_probe = list(object(
        {
          exec              = list(string)
          failure_threshold = number
          http_get = list(object(
            {
              path   = string
              port   = number
              scheme = string
            }
          ))
          initial_delay_seconds = number
          period_seconds        = number
          success_threshold     = number
          timeout_seconds       = number
        }
      ))
      memory = number
      name   = string
      ports = set(object(
        {
          port     = number
          protocol = string
        }
      ))
      readiness_probe = list(object(
        {
          exec              = list(string)
          failure_threshold = number
          http_get = list(object(
            {
              path   = string
              port   = number
              scheme = string
            }
          ))
          initial_delay_seconds = number
          period_seconds        = number
          success_threshold     = number
          timeout_seconds       = number
        }
      ))
      secure_environment_variables = map(string)
      volume = list(object(
        {
          empty_dir = bool
          git_repo = list(object(
            {
              directory = string
              revision  = string
              url       = string
            }
          ))
          mount_path           = string
          name                 = string
          read_only            = bool
          secret               = map(string)
          share_name           = string
          storage_account_key  = string
          storage_account_name = string
        }
      ))
    }
  ))
}

variable "diagnostics" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      log_analytics = list(object(
        {
          log_type      = string
          metadata      = map(string)
          workspace_id  = string
          workspace_key = string
        }
      ))
    }
  ))
  default = []
}

variable "dns_config" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      nameservers    = list(string)
      options        = set(string)
      search_domains = set(string)
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
      type         = string
    }
  ))
  default = []
}

variable "image_registry_credential" {
  description = "nested block: NestingList, min items: 0, max items: 0"
  type = set(object(
    {
      password = string
      server   = string
      username = string
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