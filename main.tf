provider "azurerm" {
  features {}
  
  # Authentication using environment variables (Client ID, Client Secret, Tenant ID)
  client_id       = var.CLIENT_ID
  client_secret   = var.SECRET
  tenant_id       = var.TENANT_ID
  subscription_id = var.SUBSCRIPTION_ID
}

provider "azuread" {
  client_id       = var.CLIENT_ID
  client_secret   = var.SECRET
  tenant_id       = var.TENANT_ID 
}




resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

/*
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.acr_sku
  admin_enabled       = false
}
*/

data "azurerm_container_registry" "acr" {
  name                = var.acr_name  
  resource_group_name = var.acr_resource_group_name 
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.cluster_dns_prefix
  automatic_upgrade_channel  = var.cluster_upgrade_channel

  default_node_pool {
    name       = var.cluster_nodepool_name
    node_count = var.cluster_node_count
    vm_size    = var.cluster_node_vm_size 
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.common_tags

 
  azure_active_directory_role_based_access_control {

  admin_group_object_ids = var.azuread_group_obejct_ids
  azure_rbac_enabled     = true
  tenant_id              = var.TENANT_ID
  }
}

resource "azurerm_role_assignment" "role_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = data.azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}

output "cluster_fqdn" {
  value = azurerm_kubernetes_cluster.cluster.fqdn
}

output "cluster_id" {
  value = azurerm_kubernetes_cluster.cluster.id
}