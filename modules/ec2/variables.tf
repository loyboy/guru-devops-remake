variable "ami" {
  description = "The ami to use for the EC2 instance"
  type        = string
}

variable "security_group" {
  description = "The security group for this Launch template"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t3.small)"
  type        = string
}

variable "server_port" {
  description = "The port number for the server and inbound sg within Apache"
  type        = number
}