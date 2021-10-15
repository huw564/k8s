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

#Container Registry
module "acr1"{
source = "../../modules/AzureRM/2.54.0/azurerm_container_registry"
name                    = "__acr1name__"
location                = azurerm_resource_group.rg1.location
resource_group_name     = azurerm_resource_group.rg1.name
}
