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

#VNET  
module "azurerm_virtual_network" {
  source = "../../modules/AzureRM/2.54.0/azurerm_virtual_network"
  address_space = ["__vnet1_address_space__"]
  location = azurerm_resource_group.rg1.location
  name = "__vnet1_name__"
  resource_group_name = azurerm_resource_group.rg1.name
  diagnostic_setting_target_resource_id = module.azurerm_virtual_network.id
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
  
#Subnets  
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
  
#Private DNS zone - file storage 
module "azurerm_private_dns_zone1" {
  source = "../../modules/AzureRM/2.54.0/azurerm_private_dns_zone"
  name = "__private_dns_zone1_name__"
  resource_group_name = azurerm_resource_group.rg1.name
}

#Private DNS zone - blob storage 
module "azurerm_private_dns_zone2" {
  source = "../../modules/AzureRM/2.54.0/azurerm_private_dns_zone"
  name = "__private_dns_zone2_name__"
  resource_group_name = azurerm_resource_group.rg1.name
}
  
#Private DNS zone - aks cluster  
module "azurerm_private_dns_zone3" {
  source = "../../modules/AzureRM/2.54.0/azurerm_private_dns_zone"
  name = "__private_dns_zone3_name__"
  resource_group_name = azurerm_resource_group.rg1.name
}
  
#Private DNS zone - acr  
module "azurerm_private_dns_zone4" {
  source = "../../modules/AzureRM/2.54.0/azurerm_private_dns_zone"
  name = "__private_dns_zone4_name__"
  resource_group_name = azurerm_resource_group.rg1.name
}

#Private DNS zone - sql
module "azurerm_private_dns_zone5" {
  source = "../../modules/AzureRM/2.54.0/azurerm_private_dns_zone"
  name = "__private_dns_zone5_name__"
  resource_group_name = azurerm_resource_group.rg1.name
}  
  
  
#Private DNS zone virtual network links    
module "azurerm_private_dns_zone_virtual_network_link1" {
  source = "../../modules/AzureRM/2.54.0/azurerm_private_dns_zone_virtual_network_link"
  name = "__private_dns_zone_virtual_network_link1__"
  private_dns_zone_name = module.azurerm_private_dns_zone1.this.name
  resource_group_name = azurerm_resource_group.rg1.name
  virtual_network_id = module.azurerm_virtual_network.id
}  

    
module "azurerm_private_dns_zone_virtual_network_link2" {
  source = "../../modules/AzureRM/2.54.0/azurerm_private_dns_zone_virtual_network_link"
  name = "__private_dns_zone_virtual_network_link2__"
  private_dns_zone_name = module.azurerm_private_dns_zone2.this.name
  resource_group_name = azurerm_resource_group.rg1.name
  virtual_network_id = module.azurerm_virtual_network.id
}
    

  module "azurerm_private_dns_zone_virtual_network_link3" {
  source = "../../modules/AzureRM/2.54.0/azurerm_private_dns_zone_virtual_network_link"
  name = "__private_dns_zone_virtual_network_link3__"
  private_dns_zone_name = module.azurerm_private_dns_zone3.this.name
  resource_group_name = azurerm_resource_group.rg1.name
  virtual_network_id = module.azurerm_virtual_network.id
  }
    
  module "azurerm_private_dns_zone_virtual_network_link4" {
  source = "../../modules/AzureRM/2.54.0/azurerm_private_dns_zone_virtual_network_link"
  name = "__private_dns_zone_virtual_network_link4__"
  private_dns_zone_name = module.azurerm_private_dns_zone4.this.name
  resource_group_name = azurerm_resource_group.rg1.name
  virtual_network_id = module.azurerm_virtual_network.id
  }
    
  module "azurerm_private_dns_zone_virtual_network_link5" {
  source = "../../modules/AzureRM/2.54.0/azurerm_private_dns_zone_virtual_network_link"
  name = "__private_dns_zone_virtual_network_link5__"
  private_dns_zone_name = module.azurerm_private_dns_zone5.this.name
  resource_group_name = azurerm_resource_group.rg1.name
  virtual_network_id = module.azurerm_virtual_network.id
  }

    
    
#Private endpoint - file storage
module "PrivateEndpoint1"{
source = "../../modules/AzureRM/2.54.0/azurerm_private_endpoint"
resource_group_name     = azurerm_resource_group.rg1.name
location = azurerm_resource_group.rg1.location
name   = "__private_endpoint1_name__"
subnet_id               = module.subnet2.id
  
  private_dns_zone_group = [{
    id                   = null
    name                 = module.azurerm_private_dns_zone1.this.name
    private_dns_zone_ids = [module.azurerm_private_dns_zone1.this.id]
  }]  
    
    private_service_connection = [{
    is_manual_connection           = false
    name                           = "__private_endpoint1_service_connection_name__"
    private_connection_resource_id = "__private_endpoint1_connection_resource_id__"
    private_ip_address             = null
    request_message                = null
    subresource_names              = ["__private_endpoint1_subresource_names__"]
    }]
}
    
#Private endpoint - blob storage
module "PrivateEndpoint2"{
source = "../../modules/AzureRM/2.54.0/azurerm_private_endpoint"
resource_group_name     = azurerm_resource_group.rg1.name
location = azurerm_resource_group.rg1.location
name   = "__private_endpoint2_name__"
subnet_id               = module.subnet2.id
  
  private_dns_zone_group = [{
    id                   = null
    name                 = module.azurerm_private_dns_zone2.this.name
    private_dns_zone_ids = [module.azurerm_private_dns_zone2.this.id]
  }]  
    
    private_service_connection = [{
    is_manual_connection           = false
    name                           = "__private_endpoint2_service_connection_name__"
    private_connection_resource_id = "__private_endpoint2_connection_resource_id__"
    private_ip_address             = null
    request_message                = null
    subresource_names              = ["__private_endpoint2_subresource_names__"]
    }]
}
    
#Private endpoint - aks cluster
module "PrivateEndpoint3"{
source = "../../modules/AzureRM/2.54.0/azurerm_private_endpoint"
resource_group_name     = azurerm_resource_group.rg1.name
location = azurerm_resource_group.rg1.location
name   = "__private_endpoint3_name__"
subnet_id               = module.subnet1.id
  
  private_dns_zone_group = [{
    id                   = null
    name                 = module.azurerm_private_dns_zone3.this.name
    private_dns_zone_ids = [module.azurerm_private_dns_zone3.this.id]
  }]  
    
    private_service_connection = [{
    is_manual_connection           = false
    name                           = "__private_endpoint3_service_connection_name__"
    private_connection_resource_id = "__private_endpoint3_connection_resource_id__"
    private_ip_address             = null
    request_message                = null
    subresource_names              = ["__private_endpoint3_subresource_names__"]
    }]
}
   
#Private endpoint - acr
module "PrivateEndpoint4"{
source = "../../modules/AzureRM/2.54.0/azurerm_private_endpoint"
resource_group_name     = azurerm_resource_group.rg1.name
location = azurerm_resource_group.rg1.location
name   = "__private_endpoint4_name__"
subnet_id               = module.subnet2.id
  
  private_dns_zone_group = [{
    id                   = null
    name                 = module.azurerm_private_dns_zone4.this.name
    private_dns_zone_ids = [module.azurerm_private_dns_zone4.this.id]
  }]  
    
    private_service_connection = [{
    is_manual_connection           = false
    name                           = "__private_endpoint4_service_connection_name__"
    private_connection_resource_id = "__private_endpoint4_connection_resource_id__"
    private_ip_address             = null
    request_message                = null
    subresource_names              = ["__private_endpoint4_subresource_names__"]
    }]
}
    
#Private endpoint - sql
module "PrivateEndpoint5"{
source = "../../modules/AzureRM/2.54.0/azurerm_private_endpoint"
resource_group_name     = azurerm_resource_group.rg1.name
location = azurerm_resource_group.rg1.location
name   = "__private_endpoint5_name__"
subnet_id               = module.subnet2.id
  
  private_dns_zone_group = [{
    id                   = null
    name                 = module.azurerm_private_dns_zone5.this.name
    private_dns_zone_ids = [module.azurerm_private_dns_zone5.this.id]
  }]  
    
    private_service_connection = [{
    is_manual_connection           = false
    name                           = "__private_endpoint5_service_connection_name__"
    private_connection_resource_id = "__private_endpoint5_connection_resource_id__"
    private_ip_address             = null
    request_message                = null
    subresource_names              = ["__private_endpoint5_subresource_names__"]
    }]
} 
