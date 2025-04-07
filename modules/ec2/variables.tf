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

variable "vpc_id" {
  type        = string
  description = "Id of created VPC"
}

variable "public_subnets_ids" {
  type        = list(string)
  description = "Ids of created public subnets"
}

variable "private_subnets_ids" {
  type        = list(string)
  description = "Ids of created private subnets"
}

variable "ec2_instances" {
  type = map(object({
    instance_type = string
    is_public     = bool
    subnet_index  = number
    key_name      = string
    root_block_device = object({
      volume_size           = number
      volume_type           = string
      iops                  = number
      delete_on_termination = bool
    })
  }))
  description = "Map of EC2 instances to be created"
}
