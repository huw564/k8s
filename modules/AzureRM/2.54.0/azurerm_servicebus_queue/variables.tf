variable "auto_delete_on_idle" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "dead_lettering_on_message_expiration" {
  description = "(optional)"
  type        = bool
  default     = "false"
}

variable "default_message_ttl" {
  description = "(optional)"
  type        = string
  default     = "P14D"
}

variable "duplicate_detection_history_time_window" {
  description = "(optional)"
  type        = string
  default     = "PT10M"
}

variable "enable_batched_operations" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enable_express" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enable_partitioning" {
  description = "(optional)"
  type        = bool
  default     = "false"
}

variable "forward_dead_lettered_messages_to" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "forward_to" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "lock_duration" {
  description = "(optional)"
  type        = string
  default     = "PT40S"
}

variable "max_delivery_count" {
  description = "(optional)"
  type        = number
  default     = "1"
}

variable "max_size_in_megabytes" {
  description = "(optional)"
  type        = number
  default     = "1024"
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "namespace_name" {
  description = "(required)"
  type        = string
}

variable "requires_duplicate_detection" {
  description = "(optional)"
  type        = bool
  default     = "false"
}

variable "requires_session" {
  description = "(optional)"
  type        = bool
  default     = "false"
}

variable "resource_group_name" {
  description = "(required)"
  type        = string
}

variable "status" {
  description = "(optional)"
  type        = string
  default     = null
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