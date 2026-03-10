output "vpc_id" {
  value = module.vpc.vpc_id
}

output "bastion_public_ip" {
  value = module.bastion_ec2.public_ip
}

output "private_instance_id" {
  value = module.private_ec2.instance_id
}