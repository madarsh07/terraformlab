variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_name" {
  description = "Name tag for EC2"
  type        = string
}

variable "security_group_name" {
  description = "Security group name"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block for SSH access"
  type        = string
}

variable "allowed_http_cidr" {
  description = "CIDR block for HTTP access"
  type        = string
}
