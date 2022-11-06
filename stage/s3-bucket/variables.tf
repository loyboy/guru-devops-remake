variable "bucket_name" {
  description = "The bucket name of S3"
  type        = string
}

# 
variable "acl" {
  description = "The acl of S3 bucket i.e public-read | private"
  type        = string
}

variable "env" {
  description = "The Environment user is in"
  type        = string
}


