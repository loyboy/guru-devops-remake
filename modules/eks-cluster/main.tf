locals {
  tags = {
    Environment = var.env
  } 
}

provider "helm" {
  kubernetes {
    host                   = module.eks_cluster.helmconfig.host
    token                  = module.eks_cluster.helmconfig.token
    cluster_ca_certificate = base64decode(module.eks_cluster.helmconfig.ca)
  }
}

module "eks_cluster" {
  source              = "Young-ook/eks/aws"
  name                = var.cluster_name
  
  subnets             = var.private_subnets 
  kubernetes_version  = var.cluster_version
  managed_node_groups = [ 
   {
        name          = "on-demand"
        min_size      = var.nodegroupondemand_min_size
        max_size      = var.nodegroupondemand_max_size
        desired_size  = var.nodegroupondemand_desired_size
        instance_type = var.nodegroupondemand_instance
   },
   {
        name          = "spot"
        min_size      = var.nodegroupspot_min_size
        max_size      = var.nodegroupspot_max_size
        desired_size  = var.nodegroupspot_desired_size
        instance_type = var.nodegroupspot_instance

        instances_distribution = {
            spot_allocation_strategy = "lowest-price"
            spot_max_price           = "0.036"
        }
   } 
]
  node_groups         = []
  fargate_profiles    = []
  tags = local.tags
}