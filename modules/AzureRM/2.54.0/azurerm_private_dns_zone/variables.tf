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

variable "soa_record" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      email         = string
      expire_time   = number
      fqdn          = string
      host_name     = string
      minimum_ttl   = number
      refresh_time  = number
      retry_time    = number
      serial_number = number
      tags          = map(string)
      ttl           = number
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