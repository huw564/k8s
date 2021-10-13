variable "address_prefix" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "address_prefixes" {
  description = "(optional)"
  type        = list(string)
  default     = null
}

variable "enforce_private_link_endpoint_network_policies" {
  description = "(optional)"
  type        = bool
  default     = "true"
}

variable "enforce_private_link_service_network_policies" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "resource_group_name" {
  description = "(required)"
  type        = string
}

variable "service_endpoint_policy_ids" {
  description = "(optional)"
  type        = set(string)
  default     = null
}

variable "service_endpoints" {
  description = "(optional)"
  type        = list(string)
  default     = null
}

variable "virtual_network_name" {
  description = "(required)"
  type        = string
}

variable "delegation" {
  description = "nested block: NestingList, min items: 0, max items: 0"
  type = set(object(
    {
      name = string
      service_delegation = list(object(
        {
          actions = list(string)
          name    = string
        }
      ))
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