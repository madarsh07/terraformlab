module "vpc" {
  source              = "./module/VPC"
  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  public_subnet_cidr  = var.public_subnet_cidr
  az                  = var.az
}

module "ec2" {
  source         = "./module/EC2"
  ami            = var.ami
  instance_type  = var.instance_type
  subnet_id      = module.vpc.public_subnet_id
  vpc_id         = module.vpc.vpc_id
  instance_name  = var.instance_name
}

module "s3" {
  source      = "./module/S3"
  bucket_name = var.bucket_name
}