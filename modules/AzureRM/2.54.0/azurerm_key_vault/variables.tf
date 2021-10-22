variable "access_policy" {
  description = "(optional)"
  type = list(object(
    {
      application_id          = string
      certificate_permissions = list(string)
      key_permissions         = list(string)
      object_id               = string
      secret_permissions      = list(string)
      storage_permissions     = list(string)
      tenant_id               = string
    }
  ))
  default = null
}

variable "enable_rbac_authorization" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enabled_for_deployment" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enabled_for_disk_encryption" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enabled_for_template_deployment" {
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

variable "purge_protection_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "resource_group_name" {
  description = "(required)"
  type        = string
}

variable "sku_name" {
  description = "(required)"
  type        = string
}

variable "soft_delete_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "soft_delete_retention_days" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "tenant_id" {
  description = "(required)"
  type        = string
}

variable "contact" {
  description = "nested block: NestingSet, min items: 0, max items: 0"
  type = set(object(
    {
      email = string
      name  = string
      phone = string
    }
  ))
  default = []
}

variable "network_acls" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      bypass                     = string
      default_action             = string
      ip_rules                   = set(string)
      virtual_network_subnet_ids = set(string)
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

#variable "diagnostic_setting_name" {}
#variable "diagnostic_setting_target_resource_id" {}
#variable "diagnostic_setting_existing_resource_id" {default = "__shared-log-analytics-workspace-id__"}
#variable "diagnostic_setting_AuditEvent_enabled" {default = "true"}
#variable "diagnostic_setting_AuditEvent_retention_policy_enabled" {default = "true"}
#variable "diagnostic_setting_AuditEvent_retention_policy_days" {default = "0" }
#variable "diagnostic_setting_AllMetrics_enabled" {default = "true"}
#variable "diagnostic_setting_AllMetrics_retention_policy_enabled" {default = "true"}
