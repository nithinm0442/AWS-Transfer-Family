module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name        = local.security_group_name
  description = "Security group to allow ftp through ssh"
  vpc_id      = data.aws_vpc.vpc.id
  
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH for SFTP"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}