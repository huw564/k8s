
####################################
############ TERRAFORM #############
####################################

provider "azurerm" { 
  features {}
}
terraform {
 backend "azurerm" {
  storage_account_name = "#{terraformstorageaccount}#"
  container_name       = "#{tfstatecontainer}#"
  key                  = "test-rg.tfstate"
  access_key  = "#{tf-storage-key}#"
 }
required_providers {
  azurerm = {
    source = "hashicorp/azurerm"
    version = "2.20.0"
  }
}
}


#Resource Group
resource "azurerm_resource_group" "ResourceGroup1" {
  name     = "test-rg"
  location = "West Europe"
}
