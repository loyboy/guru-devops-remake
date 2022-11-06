 output "eks" {
  description = "The generated AWS EKS cluster"
  value       = module.eks_cluster.cluster
}

output "role" {
  description = "The generated role of the EKS node group"
  value       = module.eks_cluster.role
}

output "oidc" {
  description = "The OIDC url the EKS node cluster"
  value       = module.eks_cluster.oidc
}

output "kubeconfig" {
  description = "Bash script to update the kubeconfig file for the EKS cluster"
  value       = module.eks_cluster.kubeconfig
}

output "features" {
  description = "Features configurations of the AWS EKS cluster"
  value       = module.eks_cluster.features
}

output "helm_host" {
  description = "Helm host endpoint"
  value       = module.eks_cluster.helmconfig.host
}

output "helm_token" {
  description = "Helm token"
  value       = module.eks_cluster.helmconfig.token
}

