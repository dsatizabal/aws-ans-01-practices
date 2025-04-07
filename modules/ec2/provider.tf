provider "aws" {
  version    = "~> 5.92"
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
