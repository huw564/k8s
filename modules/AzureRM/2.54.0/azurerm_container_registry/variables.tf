variable "admin_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "georeplication_locations" {
  description = "(optional)"
  type        = set(string)
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

variable "network_rule_set" {
  description = "(optional)"
  type = list(object(
    {
      default_action = string
      ip_rule = set(object(
        {
          action   = string
          ip_range = string
        }
      ))
      virtual_network = set(object(
        {
          action    = string
          subnet_id = string
        }
      ))
    }
  ))
  default = null
}

variable "public_network_access_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "quarantine_policy_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "resource_group_name" {
  description = "(required)"
  type        = string
}

variable "retention_policy" {
  description = "(optional)"
  type = list(object(
    {
      days    = number
      enabled = bool
    }
  ))
  default = null
}

variable "sku" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "storage_account_id" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "trust_policy" {
  description = "(optional)"
  type = list(object(
    {
      enabled = bool
    }
  ))
  default = null
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
