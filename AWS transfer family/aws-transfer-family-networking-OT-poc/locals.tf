## Locals for composite values
locals {
  vpc_name            = "${var.project_name}-${var.env}-vpc"
  public_subnet_name  = "${var.project_name}-public-subnet-${var.env}"
  private_subnet_name = "${var.project_name}-private-subnet-${var.env}"
  eips_name           = "${var.project_name}-eip-${var.env}"
  default_tags = {
    Owner       = var.owner_tag
    Environment = var.env
    Project     = var.project_name
    Terraform   = true
  }
}

## Locals for outputs
locals {
  depends_on        = [module.vpc]
  vpc_id            = var.create_vpc ? module.vpc.vpc_id : var.vpc_id
  subnet_ids        = var.create_vpc ? module.vpc.private_subnets : var.private_subnets_ids
  public_subnet_ids = var.create_vpc ? module.vpc.public_subnets : var.public_subnets_ids

}