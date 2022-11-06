output "bucket_name" {
  value       = aws_s3_bucket.terraform_state.bucket
  description = "Bucket name created"
}

output "table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "DynamoDB table name created"
}