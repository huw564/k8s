variable "name" {default = "Monitoring"}
variable "virtual_machine_id" {}
variable "publisher" {default = "Microsoft.EnterpriseCloud.Monitoring"}
variable "type" {default = "MicrosoftMonitoringAgent"}
variable "type_handler_version" {default = "1.0"}
variable "workspace_id" {}
variable "workspace_key" {}