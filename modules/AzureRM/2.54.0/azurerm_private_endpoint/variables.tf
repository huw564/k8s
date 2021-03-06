variable "location" {
  description = "(required)"
  type        = string
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "resource_group_name" {
  description = "(required)"
  type        = string
}

variable "subnet_id" {
  description = "(required)"
  type        = string
}

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "private_dns_zone_group" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      id                   = string
      name                 = string
      private_dns_zone_ids = list(string)
    }
  ))
  default = []
}

variable "private_service_connection" {
  description = "nested block: NestingList, min items: 1, max items: 1"
  type = set(object(
    {
      is_manual_connection           = bool
      name                           = string
      private_connection_resource_id = string
      private_ip_address             = string
      request_message                = string
      subresource_names              = list(string)
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