output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The vpc id in use"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "The private subnets used in connection"
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "The public subnets used in connection"
}