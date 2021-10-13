resource "azurerm_app_service_plan" "this" {
  # app_service_environment_id - (optional) is a type of string
  app_service_environment_id = var.app_service_environment_id
  # is_xenon - (optional) is a type of bool
  is_xenon = var.is_xenon
  # kind - (optional) is a type of string
  kind = var.kind
  # location - (required) is a type of string
  location = var.location
  # maximum_elastic_worker_count - (optional) is a type of number
  maximum_elastic_worker_count = var.maximum_elastic_worker_count
  # name - (required) is a type of string
  name = var.name
  # per_site_scaling - (optional) is a type of bool
  per_site_scaling = var.per_site_scaling
  # reserved - (optional) is a type of bool
  reserved = var.reserved
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # tags - (optional) is a type of map of string
  tags = var.tags

  dynamic "sku" {
    for_each = var.sku
    content {
      # capacity - (optional) is a type of number
      capacity = sku.value["capacity"]
      # size - (required) is a type of string
      size = sku.value["size"]
      # tier - (required) is a type of string
      tier = sku.value["tier"]
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