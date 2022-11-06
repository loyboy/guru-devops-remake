output "security_group_id" {
  value       = module.security_group_redis.security_group_id
  description = "The Security Group ID in use"
}