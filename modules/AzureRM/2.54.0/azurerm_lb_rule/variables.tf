variable "backend_address_pool_id" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "backend_port" {
  description = "(required)"
  type        = number
}

variable "disable_outbound_snat" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enable_floating_ip" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enable_tcp_reset" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "frontend_ip_configuration_name" {
  description = "(required)"
  type        = string
}

variable "frontend_port" {
  description = "(required)"
  type        = number
}

variable "idle_timeout_in_minutes" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "load_distribution" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "loadbalancer_id" {
  description = "(required)"
  type        = string
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "probe_id" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "protocol" {
  description = "(required)"
  type        = string
}

variable "resource_group_name" {
  description = "(required)"
  type        = string
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