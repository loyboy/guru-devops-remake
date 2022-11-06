locals {
  tags = {
    Environment = var.env
  } 
}

module "eks_nlb" {
  source       = "Young-ook/eks/aws//modules/lb-controller"
  oidc         = var.oidc
  tags         = local.tags
}