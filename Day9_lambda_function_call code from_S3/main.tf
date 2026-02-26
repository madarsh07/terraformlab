############################
# IAM Role for Lambda
############################
resource "aws_iam_role" "lambda_role" {
  name = "lambda_s3_read_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

############################
# Attach Basic Execution Role
############################
resource "aws_iam_role_policy_attachment" "basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

############################
# Lambda Function (Code From S3)
############################
resource "aws_lambda_function" "zip_reader" {
  function_name = "existing_s3_zip_reader"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.11"

  s3_bucket = "enwdevlabtest"
  s3_key    = "lambda_function.zip"

  timeout     = 60
  memory_size = 256
}