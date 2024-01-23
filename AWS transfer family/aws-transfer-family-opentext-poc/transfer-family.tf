resource "aws_transfer_server" "transfer_vpc" {  
  identity_provider_type = "SERVICE_MANAGED"
  protocols              = ["SFTP", "FTPS"]
  endpoint_type          = "VPC"
  force_destroy          = true
  security_policy_name = "TransferSecurityPolicy-2020-06"
  #logging_role           = join("", aws_iam_role.logging[*].arn)  

   endpoint_details {
      subnet_ids             = [toset(data.aws_subnets.public_subnets.ids)] #[for s in data.aws_subnets.public_subnets : s.ids]
      security_group_ids     = [module.security_group.security_group_id]
      vpc_id                 = data.aws_vpc.vpc.id
      address_allocation_ids = [data.aws_eips.eip.allocation_ids]
   }

  tags = merge(
    {
      Name = local.transfer_name
    }, local.default_tags
  )
}
