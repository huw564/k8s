resource "azurerm_kubernetes_cluster" "this" {
  # api_server_authorized_ip_ranges - (optional) is a type of set of string
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  # automatic_channel_upgrade - (optional) is a type of string
  automatic_channel_upgrade = var.automatic_channel_upgrade
  # disk_encryption_set_id - (optional) is a type of string
  disk_encryption_set_id = var.disk_encryption_set_id
  # dns_prefix - (required) is a type of string
  dns_prefix = var.dns_prefix
  # enable_pod_security_policy - (optional) is a type of bool
  enable_pod_security_policy = var.enable_pod_security_policy
  # kubernetes_version - (optional) is a type of string
  kubernetes_version = var.kubernetes_version
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # node_resource_group - (optional) is a type of string
  node_resource_group = var.node_resource_group
  # private_cluster_enabled - (optional) is a type of bool
  private_cluster_enabled = var.private_cluster_enabled
  # private_dns_zone_id - (optional) is a type of string
  private_dns_zone_id = var.private_dns_zone_id
  # private_link_enabled - (optional) is a type of bool
  private_link_enabled = var.private_link_enabled
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # sku_tier - (optional) is a type of string
  sku_tier = var.sku_tier
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "addon_profile" {
    for_each = var.addon_profile
    content {

      dynamic "aci_connector_linux" {
        for_each = addon_profile.value.aci_connector_linux
        content {
          # enabled - (required) is a type of bool
          enabled = aci_connector_linux.value["enabled"]
          # subnet_name - (optional) is a type of string
          subnet_name = aci_connector_linux.value["subnet_name"]
        }
      }

      dynamic "azure_policy" {
        for_each = addon_profile.value.azure_policy
        content {
          # enabled - (required) is a type of bool
          enabled = azure_policy.value["enabled"]
        }
      }

      dynamic "http_application_routing" {
        for_each = addon_profile.value.http_application_routing
        content {
          # enabled - (required) is a type of bool
          enabled = http_application_routing.value["enabled"]
        }
      }

      dynamic "kube_dashboard" {
        for_each = addon_profile.value.kube_dashboard
        content {
          # enabled - (required) is a type of bool
          enabled = kube_dashboard.value["enabled"]
        }
      }

      dynamic "oms_agent" {
        for_each = addon_profile.value.oms_agent
        content {
          # enabled - (required) is a type of bool
          enabled = oms_agent.value["enabled"]
          # log_analytics_workspace_id - (optional) is a type of string
          log_analytics_workspace_id = oms_agent.value["log_analytics_workspace_id"]
        }
      }

    }
  }

  dynamic "auto_scaler_profile" {
    for_each = var.auto_scaler_profile
    content {
      # balance_similar_node_groups - (optional) is a type of bool
      balance_similar_node_groups = auto_scaler_profile.value["balance_similar_node_groups"]
      # expander - (optional) is a type of string
      expander = auto_scaler_profile.value["expander"]
      # max_graceful_termination_sec - (optional) is a type of string
      max_graceful_termination_sec = auto_scaler_profile.value["max_graceful_termination_sec"]
      # new_pod_scale_up_delay - (optional) is a type of string
      new_pod_scale_up_delay = auto_scaler_profile.value["new_pod_scale_up_delay"]
      # scale_down_delay_after_add - (optional) is a type of string
      scale_down_delay_after_add = auto_scaler_profile.value["scale_down_delay_after_add"]
      # scale_down_delay_after_delete - (optional) is a type of string
      scale_down_delay_after_delete = auto_scaler_profile.value["scale_down_delay_after_delete"]
      # scale_down_delay_after_failure - (optional) is a type of string
      scale_down_delay_after_failure = auto_scaler_profile.value["scale_down_delay_after_failure"]
      # scale_down_unneeded - (optional) is a type of string
      scale_down_unneeded = auto_scaler_profile.value["scale_down_unneeded"]
      # scale_down_unready - (optional) is a type of string
      scale_down_unready = auto_scaler_profile.value["scale_down_unready"]
      # scale_down_utilization_threshold - (optional) is a type of string
      scale_down_utilization_threshold = auto_scaler_profile.value["scale_down_utilization_threshold"]
      # scan_interval - (optional) is a type of string
      scan_interval = auto_scaler_profile.value["scan_interval"]
      # skip_nodes_with_local_storage - (optional) is a type of bool
      skip_nodes_with_local_storage = auto_scaler_profile.value["skip_nodes_with_local_storage"]
      # skip_nodes_with_system_pods - (optional) is a type of bool
      skip_nodes_with_system_pods = auto_scaler_profile.value["skip_nodes_with_system_pods"]
    }
  }

  dynamic "default_node_pool" {
    for_each = var.default_node_pool
    content {
      # availability_zones - (optional) is a type of list of string
      availability_zones = default_node_pool.value["availability_zones"]
      # enable_auto_scaling - (optional) is a type of bool
      enable_auto_scaling = default_node_pool.value["enable_auto_scaling"]
      # enable_host_encryption - (optional) is a type of bool
      enable_host_encryption = default_node_pool.value["enable_host_encryption"]
      # enable_node_public_ip - (optional) is a type of bool
      enable_node_public_ip = default_node_pool.value["enable_node_public_ip"]
      # max_count - (optional) is a type of number
      max_count = default_node_pool.value["max_count"]
      # max_pods - (optional) is a type of number
      max_pods = default_node_pool.value["max_pods"]
      # min_count - (optional) is a type of number
      min_count = default_node_pool.value["min_count"]
      # name - (required) is a type of string
      name = default_node_pool.value["name"]
      # node_count - (optional) is a type of number
      node_count = default_node_pool.value["node_count"]
      # node_labels - (optional) is a type of map of string
      node_labels = default_node_pool.value["node_labels"]
      # node_taints - (optional) is a type of list of string
      node_taints = default_node_pool.value["node_taints"]
      # only_critical_addons_enabled - (optional) is a type of bool
      only_critical_addons_enabled = default_node_pool.value["only_critical_addons_enabled"]
      # orchestrator_version - (optional) is a type of string
      orchestrator_version = default_node_pool.value["orchestrator_version"]
      # os_disk_size_gb - (optional) is a type of number
      os_disk_size_gb = default_node_pool.value["os_disk_size_gb"]
      # os_disk_type - (optional) is a type of string
      os_disk_type = default_node_pool.value["os_disk_type"]
      # proximity_placement_group_id - (optional) is a type of string
      proximity_placement_group_id = default_node_pool.value["proximity_placement_group_id"]
      # tags - (optional) is a type of map of string
      tags = default_node_pool.value["tags"]
      # type - (optional) is a type of string
      type = default_node_pool.value["type"]
      # vm_size - (required) is a type of string
      vm_size = default_node_pool.value["vm_size"]
      # vnet_subnet_id - (optional) is a type of string
      vnet_subnet_id = default_node_pool.value["vnet_subnet_id"]

      dynamic "upgrade_settings" {
        for_each = default_node_pool.value.upgrade_settings
        content {
          # max_surge - (required) is a type of string
          max_surge = upgrade_settings.value["max_surge"]
        }
      }

    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      # type - (required) is a type of string
      type = identity.value["type"]
      # user_assigned_identity_id - (optional) is a type of string
      user_assigned_identity_id = identity.value["user_assigned_identity_id"]
    }
  }

  dynamic "linux_profile" {
    for_each = var.linux_profile
    content {
      # admin_username - (required) is a type of string
      admin_username = linux_profile.value["admin_username"]

      dynamic "ssh_key" {
        for_each = linux_profile.value.ssh_key
        content {
          # key_data - (required) is a type of string
          key_data = ssh_key.value["key_data"]
        }
      }

    }
  }

  dynamic "network_profile" {
    for_each = var.network_profile
    content {
      # dns_service_ip - (optional) is a type of string
      dns_service_ip = network_profile.value["dns_service_ip"]
      # docker_bridge_cidr - (optional) is a type of string
      docker_bridge_cidr = network_profile.value["docker_bridge_cidr"]
      # load_balancer_sku - (optional) is a type of string
      load_balancer_sku = network_profile.value["load_balancer_sku"]
      # network_mode - (optional) is a type of string
      network_mode = network_profile.value["network_mode"]
      # network_plugin - (required) is a type of string
      network_plugin = network_profile.value["network_plugin"]
      # network_policy - (optional) is a type of string
      network_policy = network_profile.value["network_policy"]
      # outbound_type - (optional) is a type of string
      outbound_type = network_profile.value["outbound_type"]
      # pod_cidr - (optional) is a type of string
      pod_cidr = network_profile.value["pod_cidr"]
      # service_cidr - (optional) is a type of string
      service_cidr = network_profile.value["service_cidr"]

      dynamic "load_balancer_profile" {
        for_each = network_profile.value.load_balancer_profile
        content {
          # idle_timeout_in_minutes - (optional) is a type of number
          idle_timeout_in_minutes = load_balancer_profile.value["idle_timeout_in_minutes"]
          # managed_outbound_ip_count - (optional) is a type of number
          managed_outbound_ip_count = load_balancer_profile.value["managed_outbound_ip_count"]
          # outbound_ip_address_ids - (optional) is a type of set of string
          outbound_ip_address_ids = load_balancer_profile.value["outbound_ip_address_ids"]
          # outbound_ip_prefix_ids - (optional) is a type of set of string
          outbound_ip_prefix_ids = load_balancer_profile.value["outbound_ip_prefix_ids"]
          # outbound_ports_allocated - (optional) is a type of number
          outbound_ports_allocated = load_balancer_profile.value["outbound_ports_allocated"]
        }
      }

    }
  }

  dynamic "role_based_access_control" {
    for_each = var.role_based_access_control
    content {
      # enabled - (required) is a type of bool
      enabled = role_based_access_control.value["enabled"]

      dynamic "azure_active_directory" {
        for_each = role_based_access_control.value.azure_active_directory
        content {
          # admin_group_object_ids - (optional) is a type of set of string
          admin_group_object_ids = azure_active_directory.value["admin_group_object_ids"]
          # client_app_id - (optional) is a type of string
          client_app_id = azure_active_directory.value["client_app_id"]
          # managed - (optional) is a type of bool
          managed = azure_active_directory.value["managed"]
          # server_app_id - (optional) is a type of string
          server_app_id = azure_active_directory.value["server_app_id"]
          # server_app_secret - (optional) is a type of string
          server_app_secret = azure_active_directory.value["server_app_secret"]
          # tenant_id - (optional) is a type of string
          tenant_id = azure_active_directory.value["tenant_id"]
        }
      }

    }
  }

  dynamic "service_principal" {
    for_each = var.service_principal
    content {
      # client_id - (required) is a type of string
      client_id = service_principal.value["client_id"]
      # client_secret - (required) is a type of string
      client_secret = service_principal.value["client_secret"]
    }
  }

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

  dynamic "windows_profile" {
    for_each = var.windows_profile
    content {
      # admin_password - (optional) is a type of string
      admin_password = windows_profile.value["admin_password"]
      # admin_username - (required) is a type of string
      admin_username = windows_profile.value["admin_username"]
    }
  }
  
  kubelet_identity { 
  client_id = var.kubelet_identity_client_id
  object_id = var.kubelet_identity_object_id
  user_assigned_identity_id = var.kubelet_identity_user_assigned_identity_id
  }

}
