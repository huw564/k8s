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


module "azurerm_kubernetes_cluster" {
  source = "../../modules/AzureRM/2.54.0/azurerm_kubernetes_cluster"
  dns_prefix = "__aks1_dns_prefix_name__"
  location = azurerm_resource_group.rg1.location
  name = "__aks1_name__"
  resource_group_name = azurerm_resource_group.rg1.name

  default_node_pool = [{
    availability_zones           = []
    enable_auto_scaling          = null
    enable_host_encryption       = null
    enable_node_public_ip        = null
    max_count                    = null
    max_pods                     = null
    min_count                    = null
    name                         = "__aks1_default_node_pool_name__"
    node_count                   = "1"
    node_labels                  = {}
    node_taints                  = []
    only_critical_addons_enabled = null
    orchestrator_version         = null
    os_disk_size_gb              = "30"
    os_disk_type                 = null
    proximity_placement_group_id = null
    tags                         = {}
    type                         = null
    upgrade_settings = []
    vm_size        = "Standard_D2_v2"
    vnet_subnet_id = "__akspoc-subnet1-subnet-id__"
  }]
  linux_profile = [{
    admin_username = "devops"
    ssh_key = [{
      key_data = "__akspoc1key__"
    }]
  }]

 network_profile = [{
    dns_service_ip     = null
    docker_bridge_cidr = null
    load_balancer_profile = []
    load_balancer_sku = null
    network_mode      = null
    network_plugin    = "azure"
    network_policy    = null
    outbound_type     = null
    pod_cidr          = null
    service_cidr      = null
  }]
  role_based_access_control = [{
    azure_active_directory = [{
      admin_group_object_ids = ["__akspoc1-admin-group-id__"]
      client_app_id          = null
      server_app_id          = null
      server_app_secret      = null
      tenant_id              = null
      managed                = true
    }]
    enabled = true
  }]

  identity [{
    type = "SystemAssigned" 
  }]

  windows_profile = [{
    admin_username = "__akspoc1-admin-username__"
    admin_password = "__akspoc1-admin-password__"
  }]
}
