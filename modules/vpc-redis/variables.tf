variable "vpc_name" {
  description = "The name of vpc network"
  type        = string
}

variable "cidr" {
  description = "Default cidr router address "
  type        = string
}

variable "private_subnets" {
  description = "Default Private subnet for redis application"
  type        = list
}

variable "database_subnets" {
  description = "Default Database subnet for  redis application"
  type        = list
}

variable "azs" {
  description = "Default Availablity Zones for redis application"
  type        = list
}

variable "env" {
   description = "Default environment used"
    type        = string
}