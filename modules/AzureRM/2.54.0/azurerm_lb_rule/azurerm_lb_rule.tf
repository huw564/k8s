resource "azurerm_lb_rule" "this" {
  # backend_address_pool_id - (optional) is a type of string
  backend_address_pool_id = var.backend_address_pool_id
  # backend_port - (required) is a type of number
  backend_port = var.backend_port
  # disable_outbound_snat - (optional) is a type of bool
  disable_outbound_snat = var.disable_outbound_snat
  # enable_floating_ip - (optional) is a type of bool
  enable_floating_ip = var.enable_floating_ip
  # enable_tcp_reset - (optional) is a type of bool
  enable_tcp_reset = var.enable_tcp_reset
  # frontend_ip_configuration_name - (required) is a type of string
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  # frontend_port - (required) is a type of number
  frontend_port = var.frontend_port
  # idle_timeout_in_minutes - (optional) is a type of number
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  # load_distribution - (optional) is a type of string
  load_distribution = var.load_distribution
  # loadbalancer_id - (required) is a type of string
  loadbalancer_id = var.loadbalancer_id
  # name - (required) is a type of string
  name = var.name
  # probe_id - (optional) is a type of string
  probe_id = var.probe_id
  # protocol - (required) is a type of string
  protocol = var.protocol
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name

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