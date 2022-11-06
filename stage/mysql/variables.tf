variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The name to use for the database"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage in db in Gigabytes"
  type        = number
}

variable "instance_type" {
  description = "The instance type of the DB"
  type        = string
}

variable "db_type" {
  description = "The DB type of the Relational Database i.e mysql | postgresql "
  type        = string
}

variable "env" {
  description = "Default environment you are working in"
  type        = string
}


