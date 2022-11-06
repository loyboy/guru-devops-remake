locals {
  tags = {
    Environment = var.env
  }
}

resource "aws_security_group" "instance" {
  name = var.sg_group_name
  vpc_id = var.vpc_id
  tags = local.tags
}

resource "aws_security_group_rule" "allow_server_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.instance.id
 
  from_port   = var.ingress_server_port
  to_port     = var.ingress_server_port
  protocol    = var.ingress_tcp_protocol
  cidr_blocks = var.ingress_cidr_blocks
}

resource "aws_security_group_rule" "allow_server_http_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.instance.id
 
  from_port   = var.egress_server_port
  to_port     = var.egress_server_port
  protocol    = var.egress_tcp_protocol
  cidr_blocks = var.egress_cidr_blocks
}