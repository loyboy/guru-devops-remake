locals {
  tags = {
    Environment = var.env
  }
}
module "vpc_redis" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"
  name = var.vpc_name

  cidr = var.cidr
  azs  = var.azs
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets

  create_database_subnet_group = true
  enable_nat_gateway           = false

  manage_default_security_group  = true
  default_security_group_ingress = []
  default_security_group_egress  = []

tags = local.tags
}