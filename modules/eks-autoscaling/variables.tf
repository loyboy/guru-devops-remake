variable "oidc" {
    description = "The name of OIDC endpoint"
    type        = map(any)
}

variable "cluster_name" {
    description = "The name of Cluster name"
    type        = string
}

variable "env" {
  description = "Default environment you are working in"
  type        = string
}