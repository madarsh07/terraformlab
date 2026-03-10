output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "instance_public_ip" {
  value = aws_instance.ec2.public_ip
}