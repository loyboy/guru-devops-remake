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

module "s3_bucket" {
  source = "../../modules/s3"

  bucket_name = var.bucket_name
  acl = var.acl
  env = var.env

}