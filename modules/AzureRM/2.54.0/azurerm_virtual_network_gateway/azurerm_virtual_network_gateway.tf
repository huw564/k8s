resource "azurerm_virtual_network_gateway" "this" {
  # active_active - (optional) is a type of bool
  active_active = var.active_active
  # default_local_network_gateway_id - (optional) is a type of string
  default_local_network_gateway_id = var.default_local_network_gateway_id
  # enable_bgp - (optional) is a type of bool
  enable_bgp = var.enable_bgp
  # generation - (optional) is a type of string
  generation = var.generation
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  # private_ip_address_enabled - (optional) is a type of bool
  private_ip_address_enabled = var.private_ip_address_enabled
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # sku - (required) is a type of string
  sku = var.sku
  # tags - (optional) is a type of map of string
  tags = var.tags
  # type - (required) is a type of string
  type = var.type
  # vpn_type - (optional) is a type of string
  vpn_type = var.vpn_type

  dynamic "bgp_settings" {
    for_each = var.bgp_settings
    content {
      # asn - (optional) is a type of number
      asn = bgp_settings.value["asn"]
      # peer_weight - (optional) is a type of number
      peer_weight = bgp_settings.value["peer_weight"]
      # peering_address - (optional) is a type of string
      peering_address = bgp_settings.value["peering_address"]

      dynamic "peering_addresses" {
        for_each = bgp_settings.value.peering_addresses
        content {
          # apipa_addresses - (optional) is a type of list of string
          apipa_addresses = peering_addresses.value["apipa_addresses"]
          # ip_configuration_name - (optional) is a type of string
          ip_configuration_name = peering_addresses.value["ip_configuration_name"]
        }
      }

    }
  }

  dynamic "custom_route" {
    for_each = var.custom_route
    content {
      # address_prefixes - (optional) is a type of set of string
      address_prefixes = custom_route.value["address_prefixes"]
    }
  }

  dynamic "ip_configuration" {
    for_each = var.ip_configuration
    content {
      # name - (optional) is a type of string
      name = ip_configuration.value["name"]
      # private_ip_address_allocation - (optional) is a type of string
      private_ip_address_allocation = ip_configuration.value["private_ip_address_allocation"]
      # public_ip_address_id - (required) is a type of string
      public_ip_address_id = ip_configuration.value["public_ip_address_id"]
      # subnet_id - (required) is a type of string
      subnet_id = ip_configuration.value["subnet_id"]
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

  dynamic "vpn_client_configuration" {
    for_each = var.vpn_client_configuration
    content {
      # aad_audience - (optional) is a type of string
      aad_audience = vpn_client_configuration.value["aad_audience"]
      # aad_issuer - (optional) is a type of string
      aad_issuer = vpn_client_configuration.value["aad_issuer"]
      # aad_tenant - (optional) is a type of string
      aad_tenant = vpn_client_configuration.value["aad_tenant"]
      # address_space - (required) is a type of list of string
      address_space = vpn_client_configuration.value["address_space"]
      # radius_server_address - (optional) is a type of string
      radius_server_address = vpn_client_configuration.value["radius_server_address"]
      # radius_server_secret - (optional) is a type of string
      radius_server_secret = vpn_client_configuration.value["radius_server_secret"]
      # vpn_client_protocols - (optional) is a type of set of string
      vpn_client_protocols = vpn_client_configuration.value["vpn_client_protocols"]

      dynamic "revoked_certificate" {
        for_each = vpn_client_configuration.value.revoked_certificate
        content {
          # name - (required) is a type of string
          name = revoked_certificate.value["name"]
          # thumbprint - (required) is a type of string
          thumbprint = revoked_certificate.value["thumbprint"]
        }
      }

      dynamic "root_certificate" {
        for_each = vpn_client_configuration.value.root_certificate
        content {
          # name - (required) is a type of string
          name = root_certificate.value["name"]
          # public_cert_data - (required) is a type of string
          public_cert_data = root_certificate.value["public_cert_data"]
        }
      }

    }
  }

}