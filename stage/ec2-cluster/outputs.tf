output "alb_dns_name" {
  value       = module.ec2_alb.alb_dns_name
  description = "The domain name of the load balancer"
}