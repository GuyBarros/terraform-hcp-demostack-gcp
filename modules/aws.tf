terraform {
  required_version = ">= 0.11.0"
}


//Getting the Domaing name
data "aws_route53_zone" "fdqn" {
  zone_id = var.zone_id
}



resource "aws_vpc" "demostack" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = local.common_tags

}


resource "aws_internet_gateway" "demostack" {
  vpc_id = aws_vpc.demostack.id

  tags = local.common_tags
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.demostack.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.demostack.id
}

resource "aws_route" "hcp_peering" {
  route_table_id         = aws_vpc.demostack.main_route_table_id
  destination_cidr_block = hcp_hvn.demostack.cidr_block
  vpc_peering_connection_id = hcp_aws_network_peering.demostack_peering.provider_peering_id
}


data "aws_availability_zones" "available" {}

resource "aws_subnet" "demostack" {
  count                   = length(var.cidr_blocks)
  vpc_id                  = aws_vpc.demostack.id
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = var.cidr_blocks[count.index]
  map_public_ip_on_launch = true

  tags = local.common_tags
}



resource "aws_security_group" "demostack" {
  name_prefix = var.namespace
  vpc_id      = aws_vpc.demostack.id

tags = local.common_tags
  #Allow internal communication between nodes
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = -1
  }


########HCP
  ingress {
    from_port   = 8301
    to_port     = 8301
    protocol    = "tcp"
    cidr_blocks = [hcp_hvn.demostack.cidr_block]
  }

  ingress {
    from_port   = 8301
    to_port     = 8301
    protocol    = "udp"
    cidr_blocks = [hcp_hvn.demostack.cidr_block]
  }

ingress {
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = [hcp_hvn.demostack.cidr_block]
  }

  ingress {
    from_port   = 8200
    to_port     = 8200
    protocol    = "udp"
    cidr_blocks = [hcp_hvn.demostack.cidr_block]
  }
########

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
