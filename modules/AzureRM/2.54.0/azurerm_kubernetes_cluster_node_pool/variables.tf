variable "availability_zones" {
  description = "(optional)"
  type        = list(string)
  default     = null
}

variable "enable_auto_scaling" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enable_host_encryption" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "enable_node_public_ip" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "eviction_policy" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "kubernetes_cluster_id" {
  description = "(required)"
  type        = string
}

variable "max_count" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "max_pods" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "min_count" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "mode" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "node_count" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "node_labels" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "node_taints" {
  description = "(optional)"
  type        = list(string)
  default     = null
}

variable "orchestrator_version" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "os_disk_size_gb" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "os_disk_type" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "os_type" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "priority" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "proximity_placement_group_id" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "spot_max_price" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "tags" {
  description = "(optional)"
  type        = map(string)
  default     = null
}

variable "vm_size" {
  description = "(required)"
  type        = string
}

variable "vnet_subnet_id" {
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

variable "upgrade_settings" {
  description = "nested block: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      max_surge = string
    }
  ))
  default = []
}
