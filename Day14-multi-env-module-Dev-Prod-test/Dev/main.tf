# module "Dev-S3" {
#   source = "../module/S3"
#   bucket_name = var.bucket_name
# }

resource "aws_instance" "Dev-EC2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = var.instance_name
  }
}