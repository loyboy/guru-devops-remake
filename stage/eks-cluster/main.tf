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

module "eks_vpc" {
  source = "../../modules/vpc"

  vpc_name = "eks-vpc"
  cidr = var.cidr
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  azs = var.azs

  env = var.env
}

module "eks_cluster_main" {
  source = "../../modules/eks-cluster"

  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  
  private_subnets = module.eks_vpc.private_subnets
  nodegroupondemand_min_size = var.nodegroupondemand_min_size
  nodegroupondemand_max_size = var.nodegroupondemand_max_size
  nodegroupondemand_instance = var.nodegroupondemand_instance
  nodegroupondemand_desired_size = var.nodegroupondemand_desired_size

  nodegroupspot_min_size = var.nodegroupspot_min_size
  nodegroupspot_max_size = var.nodegroupspot_max_size
  nodegroupspot_instance = var.nodegroupspot_instance
  nodegroupspot_desired_size = var.nodegroupspot_desired_size
  
  env = var.env

}

module "eks_cluster_nlb" {
  source = "../../modules/eks-nlb"

  oidc = module.eks_cluster_main.oidc
  env = var.env

}

module "eks_cluster_autoscaling" {
  source = "../../modules/eks-autoscaling"

  oidc = module.eks_cluster_main.oidc
  env = var.env
  
}
