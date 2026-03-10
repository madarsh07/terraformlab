variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "instance_type" {}
variable "ami_id" {}
variable "allowed_ssh_cidr" {}
variable "public_subnet_az" {
  description = "AZ for public subnet"
  type        = string
}

variable "private_subnet_az" {
  description = "AZ for private subnet"
  type        = string
}