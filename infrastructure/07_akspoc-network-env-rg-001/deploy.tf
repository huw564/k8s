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

  
module "azurerm_virtual_network" {
  source = "../../modules/AzureRM/2.54.0/azurerm_virtual_network"
  address_space = ["__vnet1_address_space__"]
  location = azurerm_resource_group.rg1.location
  name = "__vnet1_name__"
  resource_group_name = azurerm_resource_group.rg1.name
  diagnostic_setting_target_resource_id = module.azurerm_virtual_network.this.id
  diagnostic_setting_name="__vnet1_diagnostic_setting_name__"
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
  
module "subnet1" {
  source = "../../modules/AzureRM/2.54.0/azurerm_subnet"
  address_prefix = "__subnet1_address_prefix__"
  name = "__subnet1_name__"
  resource_group_name = azurerm_resource_group.rg1.name
  virtual_network_name = module.azurerm_virtual_network.this.name
}
  
module "subnet2" {
  source = "../../modules/AzureRM/2.54.0/azurerm_subnet"
  address_prefix = "__subnet2_address_prefix__"
  name = "__subnet2_name__"
  resource_group_name = azurerm_resource_group.rg1.name
  virtual_network_name = module.azurerm_virtual_network.this.name
}
    
module "subnet3" {
  source = "../../modules/AzureRM/2.54.0/azurerm_subnet"
  address_prefix = "__subnet3_address_prefix__"
  name = "__subnet3_name__"
  resource_group_name = azurerm_resource_group.rg1.name
  virtual_network_name = module.azurerm_virtual_network.this.name
}
