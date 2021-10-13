resource "azurerm_storage_account" "this" {
  # access_tier - (optional) is a type of string
  access_tier = var.access_tier
  # account_kind - (optional) is a type of string
  account_kind = var.account_kind
  # account_replication_type - (required) is a type of string
  account_replication_type = var.account_replication_type
  # account_tier - (required) is a type of string
  account_tier = var.account_tier
  # allow_blob_public_access - (optional) is a type of bool
  allow_blob_public_access = var.allow_blob_public_access
  # enable_https_traffic_only - (optional) is a type of bool
  enable_https_traffic_only = var.enable_https_traffic_only
  # is_hns_enabled - (optional) is a type of bool
  is_hns_enabled = var.is_hns_enabled
  # large_file_share_enabled - (optional) is a type of bool
  large_file_share_enabled = var.large_file_share_enabled
  # location - (required) is a type of string
  location = var.location
  # min_tls_version - (optional) is a type of string
  min_tls_version = var.min_tls_version
  # name - (required) is a type of string
  name = var.name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "blob_properties" {
    for_each = var.blob_properties
    content {

      dynamic "container_delete_retention_policy" {
        for_each = blob_properties.value.container_delete_retention_policy
        content {
          # days - (optional) is a type of number
          days = container_delete_retention_policy.value["days"]
        }
      }

      dynamic "cors_rule" {
        for_each = blob_properties.value.cors_rule
        content {
          # allowed_headers - (required) is a type of list of string
          allowed_headers = cors_rule.value["allowed_headers"]
          # allowed_methods - (required) is a type of list of string
          allowed_methods = cors_rule.value["allowed_methods"]
          # allowed_origins - (required) is a type of list of string
          allowed_origins = cors_rule.value["allowed_origins"]
          # exposed_headers - (required) is a type of list of string
          exposed_headers = cors_rule.value["exposed_headers"]
          # max_age_in_seconds - (required) is a type of number
          max_age_in_seconds = cors_rule.value["max_age_in_seconds"]
        }
      }

      dynamic "delete_retention_policy" {
        for_each = blob_properties.value.delete_retention_policy
        content {
          # days - (optional) is a type of number
          days = delete_retention_policy.value["days"]
        }
      }

    }
  }

  dynamic "custom_domain" {
    for_each = var.custom_domain
    content {
      # name - (required) is a type of string
      name = custom_domain.value["name"]
      # use_subdomain - (optional) is a type of bool
      use_subdomain = custom_domain.value["use_subdomain"]
    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      # type - (required) is a type of string
      type = identity.value["type"]
    }
  }

  dynamic "network_rules" {
    for_each = var.network_rules
    content {
      # bypass - (optional) is a type of set of string
      bypass = network_rules.value["bypass"]
      # default_action - (required) is a type of string
      default_action = network_rules.value["default_action"]
      # ip_rules - (optional) is a type of set of string
      ip_rules = network_rules.value["ip_rules"]
      # virtual_network_subnet_ids - (optional) is a type of set of string
      virtual_network_subnet_ids = network_rules.value["virtual_network_subnet_ids"]
    }
  }

  dynamic "queue_properties" {
    for_each = var.queue_properties
    content {

      dynamic "cors_rule" {
        for_each = queue_properties.value.cors_rule
        content {
          # allowed_headers - (required) is a type of list of string
          allowed_headers = cors_rule.value["allowed_headers"]
          # allowed_methods - (required) is a type of list of string
          allowed_methods = cors_rule.value["allowed_methods"]
          # allowed_origins - (required) is a type of list of string
          allowed_origins = cors_rule.value["allowed_origins"]
          # exposed_headers - (required) is a type of list of string
          exposed_headers = cors_rule.value["exposed_headers"]
          # max_age_in_seconds - (required) is a type of number
          max_age_in_seconds = cors_rule.value["max_age_in_seconds"]
        }
      }

      dynamic "hour_metrics" {
        for_each = queue_properties.value.hour_metrics
        content {
          # enabled - (required) is a type of bool
          enabled = hour_metrics.value["enabled"]
          # include_apis - (optional) is a type of bool
          include_apis = hour_metrics.value["include_apis"]
          # retention_policy_days - (optional) is a type of number
          retention_policy_days = hour_metrics.value["retention_policy_days"]
          # version - (required) is a type of string
          version = hour_metrics.value["version"]
        }
      }

      dynamic "logging" {
        for_each = queue_properties.value.logging
        content {
          # delete - (required) is a type of bool
          delete = logging.value["delete"]
          # read - (required) is a type of bool
          read = logging.value["read"]
          # retention_policy_days - (optional) is a type of number
          retention_policy_days = logging.value["retention_policy_days"]
          # version - (required) is a type of string
          version = logging.value["version"]
          # write - (required) is a type of bool
          write = logging.value["write"]
        }
      }

      dynamic "minute_metrics" {
        for_each = queue_properties.value.minute_metrics
        content {
          # enabled - (required) is a type of bool
          enabled = minute_metrics.value["enabled"]
          # include_apis - (optional) is a type of bool
          include_apis = minute_metrics.value["include_apis"]
          # retention_policy_days - (optional) is a type of number
          retention_policy_days = minute_metrics.value["retention_policy_days"]
          # version - (required) is a type of string
          version = minute_metrics.value["version"]
        }
      }

    }
  }

  dynamic "static_website" {
    for_each = var.static_website
    content {
      # error_404_document - (optional) is a type of string
      error_404_document = static_website.value["error_404_document"]
      # index_document - (optional) is a type of string
      index_document = static_website.value["index_document"]
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

}