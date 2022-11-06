terraform {

    # backend "s3" {
  #   bucket         = "<created_bucket_name>" # REPLACE WITH YOUR BUCKET NAME
  #   key            = "${path.module}/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "<created_dynamoDB_table_name>" # REPLACE WITH YOUR TABLE NAME
  #   encrypt        = true
  # }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

module "vpc_redis" {
  source = "../../modules/vpc-redis"

  private_subnets = var.private_subnets
  database_subnets = var.database_subnets
  cidr = var.cidr
  vpc_name = "redis-vpc"
  azs = var.azs
  env = var.env
}

module "sg_redis" {
  source = "../../modules/security-group-redis"

  name = "Security group for redis Resource with name: ${var.name}"
  vpc_id = module.vpc_redis.vpc_id
  private_subnets_cidr_blocks = module.vpc_redis.private_subnets_cidr_blocks
  vpc_cidr_block = module.vpc_redis.vpc_cidr_block
  env = var.env

}

module "redis_memorydb" {
  source = "../../modules/redis"

  name = var.name
  node_type = var.node_type
  numofshards = var.numofshards
  replicapershard = var.replicapershard
  maintanancewindow = var.maintanancewindow
  snapshotwindow = var.snapshotwindow

  security_group_id = module.sg_redis.security_group_id
  database_subnets = module.vpc_redis.database_subnets

}




