variable "private_subnets" {
  description = "Default Private subnet for k8"
  type        = list
}

variable "cluster_name" {
   description = "Default cluster name"
  type        = string
}

variable "cluster_version" {
   description = "Default cluster version"
   type        = string
}

variable "nodegroupondemand_instance" {
  description = "Default instance name to use in this group on demand"
  type        = string
}

variable "nodegroupondemand_min_size" {
  description = "Default Nodegroup minimum size of Group on demand "
  type        = number
}

variable "nodegroupondemand_max_size" {
  description = "Default Nodegroup maximum size of Group on demand "
  type        = number
}

variable "nodegroupondemand_desired_size" {
  description = "Default Nodegroup desired size of Group on demand "
  type        = number
}

variable "nodegroupspot_instance" {
  description = "Default instance to use in this group on spot"
  type        = string
}

variable "nodegroupspot_min_size" {
  description = "Default Nodegroup minimum size of Group on spot "
  type        = number
}

variable "nodegroupspot_max_size" {
  description = "Default Nodegroup maximum size of Group on spot "
  type        = number
}

variable "nodegroupspot_desired_size" {
  description = "Default Nodegroup desired size of Group on spot "
  type        = number
}

variable "env" {
  description = "Default environment you are working in"
  type        = string
}