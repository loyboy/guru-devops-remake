variable "vpc_name" {
  description = "The name of vpc network"
  type        = string
}

variable "cidr" {
  description = "Default cidr router address "
  type        = string
}

variable "private_subnets" {
  description = "Default Private subnet for web application"
  type        = list
}

variable "public_subnets" {
  description = "Default Public subnet for  web application"
  type        = list
}

variable "azs" {
  description = "Default Availablity Zones for web application"
  type        = list
}

variable "env" {
   description = "Default environment used"
    type        = string
}