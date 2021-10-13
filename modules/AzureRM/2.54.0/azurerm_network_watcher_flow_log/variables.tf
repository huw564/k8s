variable "enabled" {
  description = "(required)"
  type        = bool
  default     = "true"
}

variable "network_security_group_id" {
  description = "(required)"
  type        = string
}

variable "network_watcher_name" {
  description = "(required)"
  type        = string
}

variable "resource_group_name" {
  description = "(required)"
  type        = string
}

variable "storage_account_id" {
  description = "(required)"
  type        = string
}

variable "version" {
  description = "(optional)"
  type        = number
  default = "2"
}

variable "retention_policy" {
  description = "nested block: NestingList, min items: 1, max items: 1"
  type = set(object(
    {
      days    = number
      default = "true"
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

variable "traffic_analytics" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      enabled               = bool
      interval_in_minutes   = number
      workspace_id          = string
      workspace_region      = string
      workspace_resource_id = string
    }
  ))
  default = []
}