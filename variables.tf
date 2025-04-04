variable "region" {
  type        = string
  default     = "sa-east-1"
  description = "Region where deployment is being made"
}

variable "aws_access_key" {
  type        = string
  description = "Access key to access AWS cloud"
}

variable "aws_secret_key" {
  type        = string
  description = "Secret key to access AWS cloud"
}
