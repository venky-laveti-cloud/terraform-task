provider "aws" {
  region = "eu-north-1"
}

# Call the VPC module
module "vpc" {
  source = "./modules/vpc"
}

# Call the Security Group module
module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

# Call the EC2 module
module "ec2_instance" {
  source                 = "./modules/ec2"
  security_group_id      = module.security_group.sg_id
  instance_name          = "Web Server-1"
  key_name               = "heisenbrg"
}
