resource "azurerm_kubernetes_cluster_node_pool" "this" {
  # availability_zones - (optional) is a type of list of string
  availability_zones = var.availability_zones
  # enable_auto_scaling - (optional) is a type of bool
  enable_auto_scaling = var.enable_auto_scaling
  # enable_host_encryption - (optional) is a type of bool
  enable_host_encryption = var.enable_host_encryption
  # enable_node_public_ip - (optional) is a type of bool
  enable_node_public_ip = var.enable_node_public_ip
  # eviction_policy - (optional) is a type of string
  eviction_policy = var.eviction_policy
  # kubernetes_cluster_id - (required) is a type of string
  kubernetes_cluster_id = var.kubernetes_cluster_id
  # max_count - (optional) is a type of number
  max_count = var.max_count
  # max_pods - (optional) is a type of number
  max_pods = var.max_pods
  # min_count - (optional) is a type of number
  min_count = var.min_count
  # mode - (optional) is a type of string
  mode = var.mode
  # name - (required) is a type of string
  name = var.name
  # node_count - (optional) is a type of number
  node_count = var.node_count
  # node_labels - (optional) is a type of map of string
  node_labels = var.node_labels
  # node_taints - (optional) is a type of list of string
  node_taints = var.node_taints
  # orchestrator_version - (optional) is a type of string
  orchestrator_version = var.orchestrator_version
  # os_disk_size_gb - (optional) is a type of number
  os_disk_size_gb = var.os_disk_size_gb
  # os_disk_type - (optional) is a type of string
  os_disk_type = var.os_disk_type
  # os_type - (optional) is a type of string
  os_type = var.os_type
  # priority - (optional) is a type of string
  priority = var.priority
  # proximity_placement_group_id - (optional) is a type of string
  proximity_placement_group_id = var.proximity_placement_group_id
  # spot_max_price - (optional) is a type of number
  spot_max_price = var.spot_max_price
  # tags - (optional) is a type of map of string
  tags = var.tags
  # vm_size - (required) is a type of string
  vm_size = var.vm_size
  # vnet_subnet_id - (optional) is a type of string
  vnet_subnet_id = var.vnet_subnet_id

  dynamic "timeouts" {
    for_each = var.timeouts
    content {
      # create - (optional) is a type of string
      create = timeouts.value["create"]
      # delete - (optional) is a type of string
      delete = timeouts.value["delete"]
      # read - (optional) is a type of string
      read = timeouts.value["read"]
      # update - (optional) is a type of string
      update = timeouts.value["update"]
    }
  }

  dynamic "upgrade_settings" {
    for_each = var.upgrade_settings
    content {
      # max_surge - (required) is a type of string
      max_surge = upgrade_settings.value["max_surge"]
    }
  }

}
