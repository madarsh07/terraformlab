# terraform {
# #required_version = ">=1.10" # this will allow to work same terraform version only 
#   backend "s3" {
#     bucket = "devterraformstatefileeeeeeee"
#     key    = "Dev\terraform.tfstate"
#     region = "us-west-2"
#     use_lockfile = true #supports latest version >=1.10
#     encrypt = true
#   }
# }