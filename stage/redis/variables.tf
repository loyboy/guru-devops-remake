variable "name" {
  description = "Default name of the Redis db"
  type        = string
}

variable "cidr" {
  description = "Default cidr block"
  type        = string
}

variable "private_subnets" {
  description = "Default Private subnet for Redis"
  type        = list
}

variable "database_subnets" {
  description = "Default Database subnet for Redis"
  type        = list
}

variable "azs" {
  description = "Default Availablity Zones for Redis"
  type        = list
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
  description = "Default environment im playing in"
  type        = string
}

