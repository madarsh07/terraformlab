# resource "aws_s3_bucket" "mylabbucket" {
#   bucket = "Prod-terraformstatefile" # Must be globally unique

#   tags = {
#     Name        = "Prod-terraformstatefile"

#   }
# }


module "network_ec2" {
  source = "../module/network_ec2"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  instance_type       = var.instance_type
  ami_id              = var.ami_id
  allowed_ssh_cidr    = var.allowed_ssh_cidr
  public_subnet_az    = var.public_subnet_az
  private_subnet_az   = var.private_subnet_az

}