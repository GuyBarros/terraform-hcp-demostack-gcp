
locals {
  # Common tags to be assigned to all resources
  common_tags = {
    name            = var.namespace
    owner           = var.owner
    created-by      = var.created-by
    ttl             = var.TTL
    se-region      = var.region
    terraform      = true
    purpose        = "SE Demostack"
  }
}


variable "region" {
  description = "The region to create resources."
  default     = "eu-west-2"
}

variable "namespace" {
  description = <<EOH
this is the differantiates different demostack deployment on the same subscription, everycluster should have a different value
EOH
  default     = "connectdemo"
}




variable "consul_url" {
  description = "The url to download Consul."
  default     = "https://releases.hashicorp.com/consul/1.2.3/consul_1.2.3_linux_amd64.zip"
}

variable "consul_ent_url" {
  description = "The url to download Consul."
  default     = "https://s3-us-west-2.amazonaws.com/hc-enterprise-binaries/consul/ent/1.2.3/consul-enterprise_1.2.3%2Bent_linux_amd64.zip"
}



variable "nomad_url" {
  description = "The url to download nomad."
  default     = "https://releases.hashicorp.com/nomad/0.8.6/nomad_0.8.6_linux_amd64.zip"
}

variable "nomad_ent_url" {
  description = "The url to download nomad."
  default     = "https://releases.hashicorp.com/nomad/0.8.6/nomad_0.8.6_linux_amd64.zip"
}

variable "cni_plugin_url" {
  description = "The url to download teh CNI plugin for nomad."
  default     = "https://github.com/containernetworking/plugins/releases/download/v0.8.2/cni-plugins-linux-amd64-v0.8.2.tgz"
}

variable "vault_url" {
  description = "The url to download vault."
  default     = "https://releases.hashicorp.com/vault/0.11.1/vault_0.11.1_linux_amd64.zip"
}

variable "vault_ent_url" {
  description = "The url to download vault."
  default     = "https://s3-us-west-2.amazonaws.com/hc-enterprise-binaries/vault/ent/0.11.1/vault-enterprise_0.11.1%2Bent_linux_amd64.zip"
}

variable "owner" {
  description = "Email address of the user responsible for lifecycle of cloud resources used for training."
}

variable "hashi_region" {
  description = "the region the owner belongs in.  e.g. NA-WEST-ENT, EU-CENTRAL"
  default = "EMEA"
}

variable "created-by" {
  description = "Tag used to identify resources created programmatically by Terraform"
  default     = "Terraform"
}



variable "TTL" {
  description = "Hours after which resource expires, used by reaper. Do not use any unit. -1 is infinite."
  default     = "240"
}

variable "vpc_cidr_block" {
  description = "The top-level CIDR block for the VPC."
  default     = "10.1.0.0/16"
}

variable "cidr_blocks" {
  description = "The CIDR blocks to create the workstations in."
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "zone_id" {
  description = "The CIDR blocks to create the workstations in."
  default     = ""
}

variable "enterprise" {
  description = "do you want to use the enterprise version of the binaries"
  default     = false
}

variable "vaultlicense" {
  description = "Enterprise License for Vault"
  default     = ""
}

variable "consullicense" {
  description = "Enterprise License for Consul"
  default     = ""
}

variable "nomadlicense" {
  description = "Enterprise License for Nomad"
  default     = ""
}


variable "run_nomad_jobs" {
  default = "0"
}


variable "primary_datacenter" {
  description = "the primary datacenter for mesh gateways"
  default     = ""
}

############### HCP
variable "hcp_consul_cluster_id" {
  description = "the HCP Consul Cluster ID that you  want to use"
  default     = "hcp-demostack-consul-cluster"
}

variable "hcp_cluster_tier" {
  description = "the HCP Consul Cluster tier that you  want to use"
  default     = "development"
}

variable "hcp_hvn_id" {
  description = "the Hashicorp Virtual Network id you want use"
  default     = "guystack"
}

variable "hcp_vault_cluster_id" {
  description = "the HCP Consul Cluster ID that you  want to use"
  default     = "demostack"
}

######################## GCP
/*
variable "gcp_project" {
  description = "GCP project name"
}

variable "gcp_region" {
  description = "GCP region, e.g. us-east1"
  default     = "europe-west3"
}

variable "gcp_dns_zone_name" {
  description = "The name of the dns zone record in the GCP DNS console Not the FQDN"
}
*/