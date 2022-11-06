output "vpc_id" {
  value       = module.vpc_redis.vpc_id
  description = "The vpc id in use"
}

output "private_subnets_cidr_blocks" {
  value       = module.vpc_redis.private_subnets_cidr_blocks
  description = "The vpc private subnet CIDR blocks"
}

output "vpc_cidr_block" {
  value       = module.vpc_redis.vpc_cidr_block
  description = "The vpc CIDR block"
}

output "database_subnets" {
   value       = module.vpc_redis.database_subnets
  description = "The vpc database subnets"
}