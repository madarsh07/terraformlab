resource "aws_s3_bucket" "mylabbucket" {
  bucket = "test-terraformstatefile" # Must be globally unique

  tags = {
    Name        = "test-terraformstatefile"

  }
}