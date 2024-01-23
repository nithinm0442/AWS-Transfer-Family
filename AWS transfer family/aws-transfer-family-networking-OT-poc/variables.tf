variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "poc"
}

variable "create_vpc" {
  default = true
}

variable "project_name" {
  default = "project-poc"
}

variable "vpc_name" {
  default = "project-vpc"
}

variable "vpc_id" {
  default = ""
}

variable "private_subnets_ids" {
  default = []
  type    = list(any)
}

variable "public_subnets_ids" {
  default = []
  type    = list(any)
}


variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "private_subnets" {
  type    = list(any)
  default = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "public_subnets" {
  type    = list(any)
  default = ["10.1.3.0/24", "10.1.4.0/24"]
}

variable "enable_natgateway" {
  default = true
}

variable "enable_vpngateway" {
  default = false
}

variable "count_eip_nat" {
  default = 2
}

variable "owner_tag" {
  default = "DevOps Team"
}