variable "cluster_name" {
    description = "The name of EC2 Cluster name"
    type        = string
}

variable "launch_configuration_name" {
    description = "The name of EC2 Launch Config"
    type        = string
}

variable "aws_lb_target_group_arn" {
    description = "The load balancer target group ARN"
    type        = string
}

variable "private_subnets" {
  description = "Default Private subnet for web application"
  type        = list
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the AutoScalingGroup"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the AutoScalingGroup"
  type        = number
}