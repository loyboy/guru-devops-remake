output "bucket_name" {
  value       = module.aws_remote_backend.bucket_name
  description = "Bucket name created"
}

output "table_name" {
  value       = module.aws_remote_backend.table_name
  description = "DynamoDB table name created"
}