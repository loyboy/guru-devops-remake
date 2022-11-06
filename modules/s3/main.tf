locals {
  tags = {
    Environment = var.env
  }
}

resource "aws_s3_bucket" "bucket" {
  
  bucket = var.bucket_name
  acl    = var.acl
  force_destroy = true  

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = local.tags
  
}