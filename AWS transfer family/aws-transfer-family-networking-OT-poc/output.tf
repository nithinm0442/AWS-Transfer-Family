output "vpc_data" {
  value = {
    id                = local.vpc_id
    priv_subnet_ids   = local.subnet_ids
    public_subnet_ids = local.public_subnet_ids
  }
}