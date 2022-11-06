variable "cluster_name" {
    description = "The name of EC2 Cluster name"
    type        = string
}

variable "public_subnets" {
    description = "Default public subnets IDs"
    type        = list
}

variable "aws_security_group" {
    description = "The ID of the Security group"
    type        = string
}

variable "server_port" {
    description = "The server port used in Launch template"
    type        = string
}

variable "vpc_id" {
    description = "The VPC id used in the connection"
    type        = string
}