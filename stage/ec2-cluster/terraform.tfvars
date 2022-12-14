cluster_name = "guruloadbalancerwebapp"
cidr = "10.0.0.0/16"
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
azs = ["us-east-1a", "us-east-1b"]
instance_type = "t2.micro"
min_size = 1
max_size = 3
ami = "ami-08c40ec9ead489470"
server_port = 8081
env = "staging"