variable "sg_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "Default vpc ID "
  type        = string
}

variable "ingress_server_port" {
  description = "Default server port ingress"
  type        = number
}

variable "egress_server_port" {
  description = "Default server port egress"
  type        = number
  default = 0
}

variable "ingress_tcp_protocol" {
  description = "Default tcp protocol ingress i.e 'tcp' or '-1' "
  type        = string
}

variable "egress_tcp_protocol" {
  description = "Default tcp protocol egress i.e 'tcp' or '-1' "
  type        = string
  default = "-1"
}

variable "ingress_cidr_blocks" {
  description = "Default ips allowed into this SG"
  type        = list
  default = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  description = "Default ips allowed into this SG"
  type        = list
  default = ["0.0.0.0/0"]
}

variable "env" {
   description = "Default environment used"
    type        = string
}
