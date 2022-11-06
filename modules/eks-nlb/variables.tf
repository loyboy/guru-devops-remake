variable "oidc" {
    description = "The name of OIDC endpoint"
    type        = map(any)
}

variable "env" {
  description = "Default environment you are working in"
  type        = string
}