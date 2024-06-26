
terraform {
  backend "s3" {
    bucket = "statefile-bucket-new"
    key = "statefile"
    region = "eu-west-3"
  }
}

module "vpc" {
  source                 = "./modules/VPC"
  vpc_cidr               = var.vpc_cidr
  public_subnets_config  = var.public_subnets_config
  private_subnets_config = var.private_subnets_config
  vpc_name               = var.vpc_name
} 
module "sg" {
  source = "./modules/SG"
  sg_config = var.sg_config
  sg_name = "sg"
  vpc_id = module.vpc.vpc_id
}

module "eks" {
  source = "./modules/EKS"
  subnet_ids = concat(module.vpc.private_subnet_ids , module.vpc.public_subnet_ids)
  worker_subnet_ids = module.vpc.public_subnet_ids
 }

