resource "azurerm_sql_database" "this" {
  # collation - (optional) is a type of string
  collation = var.collation
  # create_mode - (optional) is a type of string
  create_mode = var.create_mode
  # edition - (optional) is a type of string
  edition = var.edition
  # elastic_pool_name - (optional) is a type of string
  elastic_pool_name = var.elastic_pool_name
  # extended_auditing_policy - (optional) is a type of list of object
  extended_auditing_policy = var.extended_auditing_policy
  # location - (required) is a type of string
  location = var.location
  # max_size_bytes - (optional) is a type of string
  max_size_bytes = var.max_size_bytes
  # max_size_gb - (optional) is a type of string
  max_size_gb = var.max_size_gb
  # name - (required) is a type of string
  name = var.name
  # read_scale - (optional) is a type of bool
  read_scale = var.read_scale
  # requested_service_objective_id - (optional) is a type of string
  requested_service_objective_id = var.requested_service_objective_id
  # requested_service_objective_name - (optional) is a type of string
  requested_service_objective_name = var.requested_service_objective_name
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # restore_point_in_time - (optional) is a type of string
  restore_point_in_time = var.restore_point_in_time
  # server_name - (required) is a type of string
  server_name = var.server_name
  # source_database_deletion_date - (optional) is a type of string
  source_database_deletion_date = var.source_database_deletion_date
  # source_database_id - (optional) is a type of string
  source_database_id = var.source_database_id
  # tags - (optional) is a type of map of string
  tags = var.tags
  # zone_redundant - (optional) is a type of bool
  zone_redundant = var.zone_redundant

  dynamic "import" {
    for_each = var.import
    content {
      # administrator_login - (required) is a type of string
      administrator_login = import.value["administrator_login"]
      # administrator_login_password - (required) is a type of string
      administrator_login_password = import.value["administrator_login_password"]
      # authentication_type - (required) is a type of string
      authentication_type = import.value["authentication_type"]
      # operation_mode - (optional) is a type of string
      operation_mode = import.value["operation_mode"]
      # storage_key - (required) is a type of string
      storage_key = import.value["storage_key"]
      # storage_key_type - (required) is a type of string
      storage_key_type = import.value["storage_key_type"]
      # storage_uri - (required) is a type of string
      storage_uri = import.value["storage_uri"]
    }
  }

  dynamic "threat_detection_policy" {
    for_each = var.threat_detection_policy
    content {
      # disabled_alerts - (optional) is a type of set of string
      disabled_alerts = threat_detection_policy.value["disabled_alerts"]
      # email_account_admins - (optional) is a type of string
      email_account_admins = threat_detection_policy.value["email_account_admins"]
      # email_addresses - (optional) is a type of set of string
      email_addresses = threat_detection_policy.value["email_addresses"]
      # retention_days - (optional) is a type of number
      retention_days = threat_detection_policy.value["retention_days"]
      # state - (optional) is a type of string
      state = threat_detection_policy.value["state"]
      # storage_account_access_key - (optional) is a type of string
      storage_account_access_key = threat_detection_policy.value["storage_account_access_key"]
      # storage_endpoint - (optional) is a type of string
      storage_endpoint = threat_detection_policy.value["storage_endpoint"]
      # use_server_default - (optional) is a type of string
      use_server_default = threat_detection_policy.value["use_server_default"]
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
