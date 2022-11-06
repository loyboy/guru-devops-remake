private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
azs = ["us-east-1a", "us-east-1b"]
cidr = "10.0.0.0/16"

nodegroupondemand_instance = "t3.small"
nodegroupondemand_min_size = 1
nodegroupondemand_max_size = 3
nodegroupondemand_desired_size = 1

cluster_name = "test2-k8-sample"
cluster_version = "1.17"

nodegroupspot_instance = "t3.small"
nodegroupspot_min_size = 1
nodegroupspot_max_size = 3
nodegroupspot_desired_size = 1

env = "Staging"
