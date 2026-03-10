module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr

  az_public  = var.az_public
  az_private = var.az_private
}

module "bastion_ec2" {
  source = "./modules/ec2"

  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id
  name          = "Bastion-Host"
  public_ip     = true
}

module "private_ec2" {
  source = "./modules/ec2"

  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.vpc.private_subnet_id
  name          = "Private-Server"
  public_ip     = false
}