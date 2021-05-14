
module "gcp-vpn" {
  source  = "build-and-run/gcp-vpn/aws"
  version = "0.2.0"
  # insert the 8 required variables here
  aws_region = var.region
  aws_route_tables_ids = aws_vpc.demostack.main_route_table_id
  aws_sg = aws_security_group.demostack.id
  aws_vpc = aws_vpc.demostack.id
  gcp_asn  = 65500
  gcp_cidr   = var.vpc_cidr_block
  gcp_network  = var.network-main
  gcp_region  = var.gcp_region
  customer  = "${var.cust_name}-gcp-vpn"
  environment  = "development"
  name  = "demostack-vpn"
  tags = local.common_tags
}
