resource "aws_instance" "Userdata" {
  ami = "ami-075b5421f670d735c" 
  instance_type = "t2.micro"
  user_data = file("test.sh")
}