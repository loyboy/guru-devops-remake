output "bucket_name" {
  value       = aws_s3_bucket.bucket.bucket
  description = "Bucket name created"
}

output "bucket_acl" {
  value       = aws_s3_bucket.bucket.acl
  description = "Bucket acl"
}
