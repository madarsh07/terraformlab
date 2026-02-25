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
# IAM Policy
############################
resource "aws_iam_policy" "lambda_s3_policy" {
  name = "lambda_s3_read_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject"
        ],
        Resource = "arn:aws:s3:::your-existing-bucket-name/*"
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_s3_policy.arn
}

############################
# Lambda Function
############################
resource "aws_lambda_function" "zip_reader" {
  function_name = "existing_s3_zip_reader"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.11"

  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")

  timeout     = 60
  memory_size = 256

  environment {
    variables = {
      BUCKET_NAME = "your-existing-bucket-name"
      ZIP_KEY     = "your-zip-file.zip"
    }
  }
}