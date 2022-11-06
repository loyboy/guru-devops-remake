locals {
  tags = {
    Environment = var.env
  } 
}

resource "aws_db_instance" "guru" {
  engine              = var.db_type
  allocated_storage   = var.allocated_storage
  instance_class      = var.instance_type
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  tags = local.tags
  skip_final_snapshot = true
}