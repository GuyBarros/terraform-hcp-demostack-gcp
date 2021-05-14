
//--------------------------------------------------------------------

provider "aws" {
  region  = var.primary_region
  alias   = "primary"
}


provider "consul" {

 alias   = "consul_terraprimary"
}

// Configure the provider
provider "hcp" {

}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

data "google_compute_zones" "available" {
}


module "network" {
  source         = "./modules/network"
  cust_name      = var.cust_name
  vpc_cidr_block = var.vpc_cidr_block
}

module "primarycluster" {

  source               = "./modules"
  # count   = var.create_primary_cluster ? 1 : 0
  owner                = var.owner
  region               = var.primary_region
  namespace            = var.primary_namespace
  nomadlicense         = var.nomadlicense
  enterprise           = var.enterprise
  consul_url           = var.consul_url
  consul_ent_url       = var.consul_ent_url
  nomad_url            = var.nomad_url
  nomad_ent_url        = var.nomad_ent_url
  cni_plugin_url       = var.cni_plugin_url
  vault_url            = var.vault_url
  vault_ent_url        = var.vault_ent_url
  created-by           = var.created-by
  TTL                  = var.TTL
  vpc_cidr_block       = var.vpc_cidr_block
  cidr_blocks          = var.cidr_blocks
  ####### GCP
  gcp_project          = var.gcp_project
  gcp_region           = var.gcp_region
  network-main         = module.network.network_link
  network-sub          = module.network.subnet_link
  gcp_dns_zone_name    = data.terraform_remote_state.dns.outputs.gcp_dns_zone_name
  zones                = data.terraform_remote_state.dns.outputs.gcp_dns_zone_name
  zone_id              = data.terraform_remote_state.dns.outputs.aws_sub_zone_id
}






