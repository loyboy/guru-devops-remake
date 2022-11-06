variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "Default vpc ID "
  type        = string
}

variable "private_subnets_cidr_blocks" {
  description = "Default cidr blocks belonging to the private subnets"
  type        = string
}

variable "vpc_cidr_block" {
  description = "Default cidr blocks belonging to the default VPC"
  type        = string
}

variable "env" {
   description = "Default environment used"
    type        = string
}
