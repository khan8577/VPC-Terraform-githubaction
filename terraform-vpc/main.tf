resource "aws_s3_bucket" "my_backend_bucket" {
  bucket = "terraform-backend-06jun25"

  force_destroy = true

  tags = {
    Name = "My bucket"
  }
}

module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source    = "./modules/ec2"
  My_Sg_id  = module.sg.My_Sg_id
  subnets   = module.vpc.subnet_ids
}

module "alb" {
  source = "./modules/alb"
  My_Sg_id =  module.sg.My_Sg_id
  subnets   = module.vpc.subnet_ids
  vpc_id = module.vpc.vpc_id
  instances = module.ec2.instances
}