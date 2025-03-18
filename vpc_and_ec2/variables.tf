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

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR range for VPC"
}

variable "private_subnets_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "CIDRs for private subnets"
}

variable "public_subnets_cidrs" {
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  description = "CIDRs for public subnets"
}

variable "subnets_azs" {
  type        = list(string)
  default     = ["sa-east-1a", "sa-east-1b", "sa-east-1c"]
  description = "Availability zones"
}
