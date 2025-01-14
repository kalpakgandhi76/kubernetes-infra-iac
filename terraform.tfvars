resource_group_name = "anycompany-infra-group"
location = "East US"
azuread_group_obejct_id = "144dc18f-ec09-405a-bbbf-7b56ecda2472"
cluster_dns_prefix = "anycompany"
cluster_node_count = 1
cluster_nodepool_name = "nodepool"
cluster_node_vm_size = "Standard_D2pls_v6"
cluster_name = "anycompany-np-workload"
cluster_upgrade_channel = "patch"
common_tags = {
  Created_By  = "Terraform"
  Environment  = "Development"
  System = "IDP-Usecases"
}

