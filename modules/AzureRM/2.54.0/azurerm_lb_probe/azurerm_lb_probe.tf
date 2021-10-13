resource "azurerm_lb_probe" "this" {
  # interval_in_seconds - (optional) is a type of number
  interval_in_seconds = var.interval_in_seconds
  # loadbalancer_id - (required) is a type of string
  loadbalancer_id = var.loadbalancer_id
  # name - (required) is a type of string
  name = var.name
  # number_of_probes - (optional) is a type of number
  number_of_probes = var.number_of_probes
  # port - (required) is a type of number
  port = var.port
  # protocol - (optional) is a type of string
  protocol = var.protocol
  # request_path - (optional) is a type of string
  request_path = var.request_path
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