####################################
############ TERRAFORM #############
####################################

provider "azurerm" { 
  features {}
}
terraform {
 backend "azurerm" {
  storage_account_name = "__terraformstorageaccount__"
  container_name       = "__tfstatecontainer__"
  key                  = "__tfstatename__"
  access_key           = "__tf-storage-key__"
 }
required_providers {
  azurerm = {
    source = "hashicorp/azurerm"
    version = "2.54.0"
  }
}
}


#Resource Group
resource "azurerm_resource_group" "rg1" {
  name     = "__rgname1__"
  location = "West Europe"
}


module "azurerm_log_analytics_workspace" {
  source = "../../modules/AzureRM/2.54.0/azurerm_log_analytics_workspace"
  location = azurerm_resource_group.rg1.location
  name = "__log_analytics_workspace1_name__"
  reservation_capcity_in_gb_per_day = "__log_analytics_workspace1_reservation_capcity_in_gb_per_day__"
  resource_group_name = azurerm_resource_group.rg1.name
  retention_in_days = "__log_analytics_workspace1_retention_in_days__"
  sku = "__log_analytics_workspace1_sku__"
  # tags - (optional) is a type of map of string
  tags = {
    "business unit" = "__tag_business_unit__",
  "business owner" = "__tag_business_owner__",  
  "business technical owner" = "__tag_business_technical_owner__",
  "managed by" = "__tag_managed_by__",
  "project" = "__tag_project__", 
  "application" = "__tag_application__",   
  "service importance" = "__tag_service_importance__", 
  "cost centre" = "__tag_cost_centre__",
  "deployment date" = "__tag_deployment_date__",  
  "environment" = "__tag_environment__",
  "resource group" = "__rgname1__",
  "resource name" = "__log_analytics_workspace1_name__",
  "terraform deployed" = "yes"
  }
}
