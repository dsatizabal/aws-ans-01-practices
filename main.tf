module "vpc" {
  source         = "./modules/vpc"
  region         = var.region
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
}

module "compute" {
  source                = "./modules/ec2"
  region                = var.region
  aws_access_key        = var.aws_access_key
  aws_secret_key        = var.aws_secret_key
  vpc_id                = module.vpc.vpc_id
  public_subnets_ids    = module.vpc.public_subnets_ids
  private_subnets_ids   = module.vpc.private_subnets_ids
  ec2_instances         = {
    "pub1" = {
        instance_type = "t2.micro"
        is_public     = true
        subnet_index  = 0
        key_name      = "tf-test"
        root_block_device = {
            volume_size           = 8
            volume_type           = "gp2"
            iops                  = 100
            delete_on_termination = true
        }
    },
    "priv1" = {
        instance_type = "t2.micro"
        is_public     = false
        subnet_index  = 0
        key_name      = "tf-test"
        root_block_device = {
            volume_size           = 8
            volume_type           = "gp2"
            iops                  = 100
            delete_on_termination = true
        }
    }
  }
}
