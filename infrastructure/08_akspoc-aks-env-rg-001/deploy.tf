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
    version = "2.63.0"
  }
}
}


#Resource Group
resource "azurerm_resource_group" "rg1" {
  name     = "__rgname1__"
  location = "West Europe"
}

##cluster identity
module "user_assigned_identity1" {
  source = "../../modules/AzureRM/2.54.0/azurerm_user_assigned_identity"
  location = azurerm_resource_group.rg1.location
  name = "__identity1_name__"
  resource_group_name = azurerm_resource_group.rg1.name
}

##agentpool identity
module "user_assigned_identity2" {
  source = "../../modules/AzureRM/2.54.0/azurerm_user_assigned_identity"
  location = azurerm_resource_group.rg1.location
  name = "__identity2_name__"
  resource_group_name = azurerm_resource_group.rg1.name
}
module "azurerm_kubernetes_cluster" {
  source = "../../modules/AzureRM/2.54.0/azurerm_kubernetes_cluster"
  dns_prefix = "__aks1_dns_prefix_name__"
  location = azurerm_resource_group.rg1.location
  name = "__aks1_name__"
  resource_group_name = azurerm_resource_group.rg1.name
  kubernetes_version = "__aks1_kubernetes_version__"
  private_cluster_enabled = true
  private_dns_zone_id = "__aks1_private_dns_zone_id__"
  kubelet_identity_client_id = module.user_assigned_identity2.client_id
  kubelet_identity_object_id = module.user_assigned_identity2.principal_id
  kubelet_identity_user_assigned_identity_id = module.user_assigned_identity2.id
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
    type                         = "VirtualMachineScaleSets"
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

  identity = [{
    type = "UserAssigned" 
    principal_id = null
    tenant_id = null
    user_assigned_identity_id = module.user_assigned_identity1.id
  }]

  windows_profile = [{
    admin_username = "__akspoc1-admin-username__"
    admin_password = "__akspoc1-admin-password__"
  }]

  
 addon_profile = [{
    aci_connector_linux = []
    azure_policy = [{
      enabled = true
    }]
    http_application_routing = []
    kube_dashboard = []
    oms_agent = [{
      enabled                    = true
      log_analytics_workspace_id = "__shared-log-analytics-workspace-id__"
      oms_agent_identity = [{
        client_id                 = null
        object_id                 = null
        user_assigned_identity_id = null
      }]
    }]
  }]
  
}
  
#  module "nodepool1" {
#  source = "../../modules/AzureRM/2.54.0/azurerm_kubernetes_cluster_node_pool"
#  kubernetes_cluster_id = module.azurerm_kubernetes_cluster.this.id
#  name = "__aks1_node_pool1_name__"
#  node_count = 1
#  orchestrator_version = "__aks1_kubernetes_version__"
#  os_type = "Windows"
#  vm_size = "Standard_DS2_v2"
#  vnet_subnet_id = "__akspoc-subnet1-subnet-id__"  
#  tags = {}
# }
