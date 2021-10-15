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
  key                  = "02.1_akspoc-acr-dev-rg-001.tfstate"
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
  name     = "akspoc-acr-dev-rg-001"
  location = "West Europe"
}