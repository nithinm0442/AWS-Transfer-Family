data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [local.vpc_name]
  }
}

data "aws_eips" "eip" {
  filter {
    name   = "tag:Name"
    values = [local.eips_name]
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = local.public_subnet_name
  }
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "tag:Name"
    values = [local.public_subnet_name]
  }
}

data "aws_subnet" "public_subnets_id" {
  for_each = toset(data.aws_subnets.public_subnets.ids)
  id       = each.value
}