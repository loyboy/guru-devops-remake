locals {
  tags = {
    Environment = var.env
  } 
}

module "eks_autoscaling" {
  source   = "Young-ook/eks/aws//modules/cluster-autoscaler"
  oidc     = var.oidc
  tags     = { env = var.env }
  helm = {
    vars = {
      "autoDiscovery.clusterName" = var.cluster_name
    }
  }
}