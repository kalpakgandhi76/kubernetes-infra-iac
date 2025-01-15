variable "CLIENT_ID" {
  description = "Azure Client ID"
  type        = string
}

variable "SECRET" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}

variable "TENANT_ID" {
  description = "Azure Tenant ID"
  type        = string
}

variable "SUBSCRIPTION_ID" {
  description = "Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "my-resource-group"
}

variable "cluster_name" {
  description = "The Cluster Name" 
}

variable "cluster_dns_prefix" {
  description = "The Cluster DNS Prifix" 
}

variable "cluster_nodepool_name" {
  description = "The Cluster Node Pool name"
}

variable "cluster_node_count" {
  type = number
  description = "The Node Pool Counts." 
}

variable "cluster_node_vm_size" {
  description = "The Cluster Node VM Size." 
}

variable "azuread_group_obejct_id" {
  description = "The Azure AD Group object id for Authetication and Authorization" 
}

variable "location" {
  description = "Location of the resource."
  default     = "East US"
}

variable "cluster_upgrade_channel" {
  description = "Cluster Upgrade Channel"  
}

variable "acr_name" {
  description = "The ACR Name."  
}

variable "acr_sku" {
  description = "The ACR sku."  
}

variable "common_tags" {
  type = map(string)
  default = {
    Created_By  = "Terraform"
    Environment  = "Development"
    System = "IDP-Usecases"
  }
}  
