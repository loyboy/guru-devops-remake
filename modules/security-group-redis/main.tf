
locals {
  tags = {
    Environment = var.env
  }
}

module "security_group_redis" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = var.name
  description = "Security group for ${var.name}"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = var.private_subnets_cidr_blocks
  ingress_rules       = ["redis-tcp"]

  egress_cidr_blocks = [var.vpc_cidr_block]
  egress_rules       = ["all-all"]

  tags = local.tags
}