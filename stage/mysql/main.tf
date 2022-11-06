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
  source = "../../modules/mysql"

  db_username = var.db_username
  db_name = var.db_name
  db_password = var.db_password
  db_type = var.db_type
  allocated_storage = var.allocated_storage
  instance_type = var.instance_type

  env = var.env

}