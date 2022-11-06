output "address" {
  value       = aws_db_instance.guru.address
  description = "Connect to the database at this endpoint"
}

output "port" {
  value       = aws_db_instance.guru.port
  description = "The port the database is listening on"
}

# It took approximately 4.30mins to create this resource 
