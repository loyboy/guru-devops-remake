variable "name" {
  description = "Default name of the Redis db"
  type        = string
}

variable "node_type" {
  description = "Default Node Type"
  type        = string
}

variable "numofshards" {
  description = "Default Number of Shards"
  type        = number
}

variable "replicapershard" {
  description = "Default Replica per shard"
  type        = number
}

variable "maintanancewindow" {
  description = "Default Maintainance window"
  type        = string
}

variable "snapshotwindow" {
  description = "Default Snapshot window"
  type        = string
}

variable "env" {
  description = "Default environment you are working in"
  type        = string
}

variable "security_group_id" {
  description = "Default security group ID"
  type        = string
}

variable "database_subnets" {
  description = "Default database subnets"
  type        = list
}