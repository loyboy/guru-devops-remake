locals {
  tags = {
    Environment = var.env
  }
}

module "memory_db" {
  source = "terraform-aws-modules/memory-db/aws"

  # Cluster
  name        = var.name
  description = "MemoryDB cluster"

  engine_version             = "6.2"
  auto_minor_version_upgrade = true
  node_type                  =  var.node_type #"db.t4g.small"
  num_shards                 = var.numofshards
  num_replicas_per_shard     = var.replicapershard

  tls_enabled              = true
  security_group_ids       = [var.security_group_id]
  maintenance_window       = var.maintanancewindow #"sun:23:00-mon:01:30"
  sns_topic_arn            = aws_sns_topic.example.arn
  snapshot_retention_limit = 7
  snapshot_window          = var.snapshotwindow #"05:00-09:00"

  # Users
  users = {
    admin = {
      user_name     = "admin-user"
      access_string = "on ~* &* +@all"
      passwords     = [random_password.password["admin"].result]
      tags          = { user = "admin-redis" }
    }
    readonly = {
      user_name     = "readonly-user"
      access_string = "on ~* &* -@all +@read"
      passwords     = [random_password.password["readonly"].result]
      tags          = { user = "readonly-redis" }
    }
  }

  # ACL
  acl_name = "${var.name}-acl"
  acl_tags = { acl = "custom" }

  # Parameter group
  parameter_group_name        = "${var.name}-param-group"
  parameter_group_description = "MemoryDB parameter group"
  parameter_group_family      = "memorydb_redis6"
  parameter_group_parameters = [
    {
      name  = "activedefrag"
      value = "yes"
    }
  ]
  parameter_group_tags = {
    parameter_group = "custom"
  }

  # Subnet group
  subnet_group_name        = "${var.name}-subnet-group"
  subnet_group_description = "MemoryDB subnet group"
  subnet_ids               = var.database_subnets
  subnet_group_tags = {
    subnet_group = "custom"
  }

  tags = local.tags
}

resource "aws_sns_topic" "example" {
  name              = var.name
  kms_master_key_id = "alias/aws/sns"

  tags = local.tags
}

resource "random_password" "password" {
  for_each = toset(["admin", "readonly"])

  length           = 16
  special          = true
  override_special = "_%@"
}