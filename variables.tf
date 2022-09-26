variable "name" {
    description = "(Required) The name of the Managed Kubernetes Cluster to create."
    type = string  
}

variable "location" {
    description = "(Required) The location where the Managed Kubernetes Cluster should be created"
    type = string  
}

variable "resource_group_name" {
    description = "(Required) Specifies the Resource Group where the Managed Kubernets Cluster Should exist"
    type = string  
}

variable "default_node_pool" {
    description = "(Required) A default_node_pool block as defined in module.tf"
    type = list(any)
    default = null  
}

variable "dns_prefix" {
    description = "DNS prefix specified when created the managed cluster"
    type = string
    default = null  
}

variable "dns_prefix_private_cluster" {
    description = "Specifies the DNS prefix to use with private clusters."
    type = string
    default = null
}

variable "aci_connector_linux" {
  description = "A aci_connector_linux block as defined in module.tf"
  type = map(any)
  default = null
}

variable "automatic_channel_upgrade" {
  description = "The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to non."
  type = string
  default = null  
}

variable "api_server_authorized_ip_ranges" {
  description = "The IP ranges to allow for incoming traffic to the server nodes."
  type = list(string)
  default = null
}

variable "auto_scaler_profile" {
  description = "A auto_scaler_profile block as defined in main.tf"
  type = map(any)
  default = null
}

variable "azure_active_directory_role_based_access_control" {
    description = "A azure_active_directory_role_based_access_control block as defined in main.tf"
    type = map(any)
    default = null
}

variable "azure_policy_enabled" {
  description = "Should the Azure Policy Add-On be enabled?"
  type = bool
  default = null
}

variable "disk_encryption_set_id" {
    description = "The ID of the Disk Encryption Set which should be used for the Nodes and Volumes"
    type = string
    default = null
}

variable "http_application_routing_enabled" {
  description = "Should HTTP application Routing be enabled?"
  type = bool
  default = null
}

variable "http_proxy_config" {
    description = "A http_proxy)config block as defined in main.tf"
    type = map(any)
    default = null
}

variable "identity" {
  description = "An identity block as defined in main.tf. One of either identity or service_principal must be specified"
  type = map(any)
  default = null
}

variable "ingress_appliation_gateway" {
    description = "A ingress_application_gateway block as defined in module.tf"
    type = map(any)
    default = null  
}

variable "key_vault_secrets_provider" {
  description = "A key_vault_secrets_provider block as defined in module.tf"
  type = map(any)
  default = null
}

variable "kubelet_identity" {
  description = "A kubelet_identity block as defined in module.tf"
  type = map(any)
  default = null
}

variable "kubernetes_version" {
    description = "Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time(but wont be upgrade). AKS does not require an exact patch version to be specified, minor version aliases such as 1.22 are also supported"
    type = string
    default = null  
}

variable "linux_profile" {
  description = "A linux_profile block as defined in module.t"
  type = map(any)
  default = null
}

variable "local_account_disabled" {
    description = "If true local accounts will be disabled. Defaults to false."
    type = bool
    default = null  
}

variable "maintenance_window" {
    description = "A maintenance_window block as defined module.tf"
    type = map(any)
    default = null  
}

variable "microsoft_defender" {
  description = "A microsoft_defender block as defined in module.tf"
  type = map(any)
  default = null
}

variable "network_profile" {
  description = "A network_profile block as defined in module.tf"
  type = map(any)
  default = null
}

variable "node_resource_group" {
    description = "The name of the resource group where the kubernetes nodes should exist."
    type = string
    default = null
}

variable "oidc_issuer_enabled" {
  description = "(required) Enable or dDisable the OIDC issuer URL"
  type = bool
  default = null
}

variable "oms_agent" {
    description = "A oms_agent block as defined in module.tf"
    type = map(any)
    default = null
}

variable "open_service_mesh_enabled" {
  description = "Is open service mesh enabled?"
  type = bool
  default = null
}

variable "private_cluster_enabled" {
  description = "Should this Kubernetes Cluster have its API server only exposed on internal IP address? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false"
  type = bool
  default = false
}

variable "private_dns_zone_id" {
    description = "Either the ID of Private DNS Zone which should be delegated to this Cluster, System to have AKS manage this or None. In case of None you will need to bring your own DNS server and set up resolving, otherwise cluster will have issues after provisioning"
    type = string
    default = null  
}

variable "private_cluster_public_fqdn_enabled" {
  description = "Specifies whether a Public FQDN for this private Cluster should be added. Defaults to false."
  type = bool
  default = false
}

variable "public_network_access_enabled" {
    description = "whether public network access is allowed for this Kubernetes Cluster. Defaults to true."
    type = bool
    default = true
}

variable "role_based_access_control_enabled" {
    description = "Whether role Based Access Control for the Kubernetes Cluster should be enabled. Defaults to true."
    type = bool
    default = true
}

variable "run_command_enabled" {
  description = "Whether to enable run command for the cluster or not. Defaults to true"
  type = bool
  default = true
}

variable "service_principal" {
  description = "A service_principal block as documented below. One of either identity or service_principal must be specified."
  type = map(any)
  default = null
}

variable "sku_tier" {
    description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible vaules are Free and Paid(which includes the Uptime SLA). Defaults to Free."
    type = string
    default = null  
}

variable "tags" {
  description = "A windows_profile block as defined module.tf"
  type = map(string)
  default = null
}

variable "windows_profile" {
    description = "A windows_profile block as defined module.tf"
    type = map(any)
    default = null
}

































