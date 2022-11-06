variable "cluster_name" {
  description = "The name to use for all the cluster resources in staging"
  type        = string
}

variable "cidr" {
  description = "The name of CIDR address"
  type        = string
}

variable "private_subnets" {
  description = "Default Private subnet for web application in staging"
  type        = list
}

variable "public_subnets" {
  description = "Default Public subnet for  web application in staging"
  type        = list
}

variable "azs" {
  description = "Default Availablity Zones for web application in staging"
  type        = list
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t3.small) in staging"
  type        = string
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the AutoScalingGroup in staging"
  type        = number
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the AutoScalingGroup in staging"
  type        = number
}


variable "ami" {
  description = "The ami to use for the EC2 instance in staging"
  type        = string
}

variable "server_port" {
  description = "The port number for the server and inbound sg within server in staging"
  type        = number
}

variable "env" {
  description = "The environment variable"
  type        = string
}

