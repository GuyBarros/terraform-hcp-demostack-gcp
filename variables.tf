/*
data "http" "myipaddr" {
  url = "http://ipv4.icanhazip.com"
}

locals {
  host_access_ip = ["${chomp(data.http.myipaddr.body)}/32"]
}
*/


variable "create_primary_cluster" {
  description = "Set to true if you want to deploy the AWS delegated zone."
  type        = bool
  default     = "true"
}



variable "namespace" {
  description = <<EOH
this is the differantiates different demostack deployment on the same subscription, everycluster should have a different value
EOH
  default     = "primarystack"
}

variable "primary_namespace" {
  description = <<EOH
this is the differantiates different demostack deployment on the same subscription, everycluster should have a different value
EOH

  default = "primarystack"
}



variable "primary_region" {
  description = "The region to create resources."
  default     = "eu-west-2"
}



variable "consul_url" {
  description = "The url to download Consul."
  default     = "https://releases.hashicorp.com/consul/1.2.2/consul_1.2.2_linux_amd64.zip"
}

variable "consul_ent_url" {
  description = "The url to download Consul."
  default     = "https://releases.hashicorp.com/consul/1.2.2/consul_1.2.2_linux_amd64.zip"
}

variable "nomad_url" {
  description = "The url to download nomad."
  default     = "https://releases.hashicorp.com/nomad/0.8.4/nomad_0.8.4_linux_amd64.zip"
}

variable "nomad_ent_url" {
  description = "The url to download nomad."
  default     = "https://releases.hashicorp.com/nomad/0.8.4/nomad_0.8.4_linux_amd64.zip"
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
  description = "IAM user responsible for lifecycle of cloud resources used for training"
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


variable "nomadlicense" {
  description = "Enterprise License for Nomad"
  default     = ""
}

variable "primary_datacenter" {
  description = "the primary datacenter for mesh gateways"
  default     = ""
}

variable "hcp_consul_cluster_id" {
  description = "the HCP Consul Cluster ID that you  want to use"
  default     = "demostack"
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
