module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "3.19.0"
  create_vpc      = var.create_vpc
  name            = local.vpc_name
  cidr            = var.vpc_cidr
  azs             = data.aws_availability_zones.available.names
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway   = var.enable_natgateway
  single_nat_gateway   = true
  reuse_nat_ips        = true # <= Skip creation of EIPs for the NAT Gateways
  external_nat_ip_ids  = aws_eip.nat.*.id
  enable_vpn_gateway   = var.enable_vpngateway
  enable_dns_hostnames = true

  public_subnet_tags = merge(
    {
      Name = local.public_subnet_name
    }, local.default_tags
  )

  private_subnet_tags = merge(
    {
      Name = local.private_subnet_name
    }, local.default_tags
  )

  tags = local.default_tags
}


resource "aws_eip" "nat" {
  count = var.count_eip_nat

  vpc = true
  tags = merge(
    {
      Name = local.eips_name
    }, local.default_tags
  )
}