//--------------------------EMEA-SE_PLAYGROUND-2019-----------------------------------------
# Using a single workspace:

terraform {
  backend "remote" {
    organization = "emea-se-playground-2019"

    workspaces {
      name = "GUY-HCP-DEMOSTACK-GCP"
    }
  }
}

data "terraform_remote_state" "dns" {
  backend = "remote"

  config = {
    hostname     = "app.terraform.io"
    organization = "emea-se-playground-2019"
    workspaces = {
      name = "Guy-DNS-Zone"
    }
  } //network
}