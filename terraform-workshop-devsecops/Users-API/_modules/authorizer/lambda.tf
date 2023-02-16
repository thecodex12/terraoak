resource "aws_lambda_function" "Authorizer" {
  function_name = "Authorizer"


  s3_bucket = "terraformnew-webinar-demo-files"
  s3_key    = "authorizer.zip"

  runtime = "nodejs14.x"
  handler = "authorizer.handler"

  source_code_hash = var.source_code_hash_get
  role = aws_iam_role.lambda_exec_auth.arn
}

resource "aws_iam_role" "lambda_exec_auth" {
  name = "serverless_lambda_authorizer"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}