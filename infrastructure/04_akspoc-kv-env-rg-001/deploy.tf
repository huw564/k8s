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


###Key Vault1###
module "KeyVault1"{
source = "../../modules/AzureRM/2.54.0/azurerm_key_vault"
resource_group_name     = azurerm_resource_group.rg1.name
location = azurerm_resource_group.rg1.location
name            = "__keyvault1_name__"
tenant_id                = "__tenantid__"
sku_name                  = "__keyvault1_sku_name__"
purge_protection_enabled = "__keyvault1_purge_protection_enabled__"
  access_policy = [{
    application_id          = null
    certificate_permissions = []
    key_permissions         = []
    object_id               = null
    secret_permissions      = []
    storage_permissions     = []
    tenant_id               = null
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
  "resource name" = "__keyvault1_name__",
  "terraform deployed" = "yes"
}
}
