name = "redis-091332"
cidr = "10.99.0.0/18"
private_subnets = ["10.99.0.0/24", "10.99.1.0/24"]
database_subnets = ["10.99.21.0/24", "10.99.22.0/24"]
azs = ["us-east-1b", "us-east-1c"]

node_type = "db.t4g.small"
numofshards = 2
replicapershard = 2
maintanancewindow = "sun:23:00-mon:01:30"
snapshotwindow = "05:00-09:00"
env = "staging"