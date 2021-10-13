variable "analytical_storage_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enable_automatic_failover" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enable_free_tier" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enable_multiple_write_locations" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "ip_range_filter" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "is_virtual_network_filter_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "key_vault_key_id" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "kind" {
  description = "(optional)"
  type        = string
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

variable "offer_type" {
  description = "(required)"
  type        = string
}

variable "public_network_access_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
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

variable "capabilities" {
  description = "nested block: NestingSet, min items: 0, max items: 0"
  type = set(object(
    {
      name = string
    }
  ))
  default = []
}

variable "consistency_policy" {
  description = "nested block: NestingList, min items: 1, max items: 1"
  type = set(object(
    {
      consistency_level       = string
      max_interval_in_seconds = number
      max_staleness_prefix    = number
    }
  ))
}

variable "geo_location" {
  description = "nested block: NestingSet, min items: 1, max items: 0"
  type = set(object(
    {
      failover_priority = number
      id                = string
      location          = string
      prefix            = string
      zone_redundant    = bool
    }
  ))
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

variable "virtual_network_rule" {
  description = "nested block: NestingSet, min items: 0, max items: 0"
  type = set(object(
    {
      id                                   = string
      ignore_missing_vnet_service_endpoint = bool
    }
  ))
  default = []
}
