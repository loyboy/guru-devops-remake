  output "server_port" {
   value       = var.server_port
  description = "Port used in Launch Template"
 }

 output "name" {
    value       = aws_launch_configuration.guru.name
  description = "Aws launch config name"
 }