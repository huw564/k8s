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

module "SQLServer1" {
  source = "../../modules/AzureRM/2.54.0/azurerm_sql_server"
name                          = "__sql_server1_name__" 
resource_group_name           = azurerm_resource_group.rg1.name
location                      = azurerm_resource_group.rg1.location
administrator_login           = "__akspoc-sql-admin-login-username__" 
administrator_login_password  = "__akspoc-sql-admin-login-password__"
  identity = [{
    principal_id = null
    tenant_id    = null
    type         = "SystemAssigned"
  }]

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
  "resource name" = "__sql_server1_name__",
  "terraform deployed" = "__tag_terraformdeployed__"
}
}

  
module "azurerm_virtual_network" {
  source = "../../modules/AzureRM/2.54.0/azurerm_virtual_network"
  address_space = ["__vnet1_address_space__"]
  location = azurerm_resource_group.rg1.location
  name = "__vnet1_name__"
  resource_group_name = azurerm_resource_group.rg1.name
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
  "resource name" = "__vnet1_name__",
  "terraform deployed" = "__tag_terraformdeployed__"
}
}
