resource_group_name = "anycompany-group"
location = "East US"
azuread_group_obejct_ids = ["144dc18f-ec09-405a-bbbf-7b56ecda2472", "a2d89136-b086-4755-9f98-af856c2d8c30"]
cluster_dns_prefix = "anycompany-workload"
cluster_node_count = 1
cluster_nodepool_name = "nodepool"
cluster_node_vm_size = "Standard_A2_v2"
cluster_name = "anycompany-workload"
cluster_upgrade_channel = "patch"
common_tags = {
  Created_By  = "Terraform"
  Environment  = "Development"
  System = "IDP-Usecases"
}
acr_name = "anycompanyacr"
acr_sku = "Basic"
acr_resource_group_name = "anycompany-infra-group"
