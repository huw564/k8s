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



####nic 1##
locals {
  ip_configurationNIC1 = {
    "01" = {
    name                          = "__nic1_ipconfig1_name__"
    primary                       = null
    private_ip_address            = null
    private_ip_address_allocation = "__nic1_ipconfig1_private_ip_address_allocation__"
    private_ip_address_version    = null
    public_ip_address_id          = null
    subnet_id                     = "__nic1_ipconfig1_subnet_id__"
    }
  }
}
module "NIC1" {
source = "../../modules/AzureRM/2.54.0/azurerm_network_interface"
name                                                        = "__nic1_name__"
location                                                    = azurerm_resource_group.rg1.location
resource_group_name                                         = azurerm_resource_group.rg1.name
ip_configuration = local.ip_configurationNIC1
tags = {}
}
  
module "azurerm_windows_virtual_machine" {
  source = "../../modules/AzureRM/2.54.0/azurerm_windows_virtual_machine"
  admin_password = "__akspoc1-vm-admin-password__"
  admin_username = "__akspoc1-vm-admin-username__"
  computer_name = "__vm1_name__"
  enable_automatic_updates = true
  license_type = "__vm1_license_type__"
  location = azurerm_resource_group.rg1.location
  name = "__vm1_name__"
  network_interface_ids = [module.NIC1.id]
  provision_vm_agent = true
  resource_group_name = azurerm_resource_group.rg1.name
  size = "__vm1_size__"

  os_disk = [{
    caching = "__vm1_os_disk_caching__"
    diff_disk_settings = []
    disk_encryption_set_id    = null
    disk_size_gb              = null
    name                      = "__vm1_os_disk_name__"
    storage_account_type      = "__vm1_os_disk_storage_account_type__"
    write_accelerator_enabled = null
  }]

  source_image_reference = [{
    offer     = "__vm1_source_image_reference_offer__"
    publisher = "__vm1_source_image_reference_publisher__"
    sku       = "__vm1_source_image_reference_sku__"
    version   = "__vm1_source_image_reference_version__"
  }]

}
  
  
