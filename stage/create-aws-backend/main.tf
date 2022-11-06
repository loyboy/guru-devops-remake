terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

module "aws_remote_backend" {
  source = "../../modules/aws-terraform-backend"

  bucketname = var.bucketname
  tablename = var.tablename
  
}