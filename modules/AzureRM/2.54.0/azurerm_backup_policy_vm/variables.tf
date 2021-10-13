variable "instant_restore_retention_days" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "recovery_vault_name" {
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

variable "timezone" {
  description = "(optional)"
  type        = string
  default     = "GMT Standard Time"
}

variable "backup" {
  description = "nested block: NestingList, min items: 1, max items: 1"
  type = set(object(
    {
      frequency = string
      time      = string
      weekdays  = set(string)
    }
  ))
}

variable "retention_daily" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      count = number
    }
  ))
  default = []
}

variable "retention_monthly" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      count    = number
      weekdays = set(string)
      weeks    = set(string)
    }
  ))
  default = []
}

variable "retention_weekly" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      count    = number
      weekdays = set(string)
    }
  ))
  default = []
}

variable "retention_yearly" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      count    = number
      months   = set(string)
      weekdays = set(string)
      weeks    = set(string)
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