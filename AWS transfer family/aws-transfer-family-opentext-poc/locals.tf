## Locals for composite values
locals {
  vpc_name = "${var.project_name}-${var.env}-vpc"
  public_subnet_name  = "${var.project_name}-public-subnet-${var.env}"
  private_subnet_name = "${var.project_name}-private-subnet-${var.env}"
  eips_name           = "${var.project_name}-eip-${var.env}"
  transfer_name       = "${var.project_name}-transfer-family-${var.env}"
  security_group_name = "${var.project_name}-transfer-family-sg-${var.env}"
  
  default_tags = {
    Owner       = var.owner_tag
    Environment = var.env
    Project     = var.project_name
    Terraform   = true
  }
}