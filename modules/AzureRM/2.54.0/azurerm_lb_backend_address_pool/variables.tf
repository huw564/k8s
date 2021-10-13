variable "loadbalancer_id" {
  description = "(required)"
  type        = string
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "resource_group_name" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "backend_address" {
  description = "nested block: NestingSet, min items: 0, max items: 0"
  type = set(object(
    {
      ip_address         = string
      name               = string
      virtual_network_id = string
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