variable "name" {default = "DependencyAgent"}
variable "virtual_machine_id" {}
variable "publisher" {default = "Microsoft.Azure.Monitoring.DependencyAgent"}
variable "type" {default = "DependencyAgentWindows"}
variable "type_handler_version" {default = "9.6"}
variable "workspace_id" {}
variable "workspace_key" {}