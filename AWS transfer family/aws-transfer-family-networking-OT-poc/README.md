# aws-transfer-family-networking-poc

## Introduction
The purpose of this repository is to complement the Proof of Concept for AWS Transfer Family for OpenText, providing the basic networking stack required to accomplish the PoC layedout in the the Lucid Charts diagram in the repository https://github.com/xerris/aws-transfer-family-opentext-poc


## Prerequisites 
Terraform version ~> 1.3.9
The  .terraform-version or version.tf works with tfenv . It will install if needed and switch to the Terraform version specified.

awscli version `aws-cli/2.11.2`

## version.tf 
```
terraform {
  required_version = "~> 1.3.9"
}
```

## aws-version
```
aws = {
      source  = "hashicorp/aws"
      version = "~> 4.59.0"
    }
```



## Environment Variables

Environment variables needed to execute this deployment.

| Name | Value | Description |
|------|---------|--------|
|AWS_ACCESS_KEY_ID| n/a | n/a |
|AWS_SECRET_ACCESS_KEY| n/a | n/a |
|AWS_REGION | us-east-1| n/a |
|ENV | poc | n/a |

