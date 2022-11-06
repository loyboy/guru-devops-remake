terraform {
  # backend "s3" {
  #   bucket         = "<created_bucket_name>" # REPLACE WITH YOUR BUCKET NAME
  #   key            = "${path.module}/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "<created_dynamoDB_table_name>" # REPLACE WITH YOUR TABLE NAME
  #   encrypt        = true
  # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

locals {
  http_port    = 80 # default ALB port
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}

module "ec2_vpc" {
  source = "../../modules/vpc"

  vpc_name = "ec2-vpc-${random_string.random_suffix.result}"
  cidr = var.cidr
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  azs = var.azs

  env = var.env
}


#------------Configure the Autoscaling group

module "sg_ec2_i_ingress" {
  source = "../../modules/security-group"

  sg_group_name = "${var.cluster_name}-instance"
  vpc_id = module.ec2_vpc.vpc_id

  ingress_server_port = var.server_port
  ingress_tcp_protocol = local.tcp_protocol
  ingress_cidr_blocks = local.all_ips 

  env = var.env

}

module "ec2_template" {
  source = "../../modules/ec2"

  ami = var.ami
  server_port = var.server_port
  instance_type = var.instance_type
  
  security_group = module.sg_ec2_i_ingress.id
}

module "ec2_autoscaling_group" {
  source = "../../modules/autoscaling"

  launch_configuration_name = module.ec2_template.name
  cluster_name = var.cluster_name
  aws_lb_target_group_arn = "" //fill this later pls
  private_subnets = module.ec2_vpc.private_subnets
  min_size = var.min_size
  max_size = var.max_size

}

#---------Configure the Load balancer here
module "sg_ec2_lb_ingress_n_egress" {
  source = "../../modules/security-group"

  sg_group_name = "${var.cluster_name}-alb"
  vpc_id = module.ec2_vpc.vpc_id

  ingress_server_port = local.http_port # egress is port 80 default
  ingress_tcp_protocol = local.tcp_protocol # egress is "-1"
  ingress_cidr_blocks = local.all_ips # same

  #Egress has defaults set already

  env = var.env

}

module "ec2_alb" {
  source = "../../modules/alb"

  cluster_name = var.cluster_name
  public_subnets = module.ec2_vpc.public_subnets
  aws_security_group = module.sg_ec2_lb_ingress_n_egress.id

  vpc_id = module.ec2_vpc.vpc_id
  server_port = var.server_port

}

