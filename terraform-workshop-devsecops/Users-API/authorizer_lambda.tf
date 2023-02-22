resource "aws_lambda_function" "Authorizer" {
  function_name = "Authorizer"


  s3_bucket = "terraformnew-webinar-demo-files"
  s3_key    = "authorizer.zip"

  runtime = "nodejs14.x"
  handler = "authorizer.handler"

  source_code_hash = data.archive_file.authorizer.output_base64sha256
  role = aws_iam_role.lambda_exec_auth.arn

    depends_on = [
    aws_s3_bucket.lambda_bucket
  ]

}

resource "aws_lambda_permission" "allow_api-gateway" {
  statement_id  = "AllowExecutionFromApiGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.Authorizer.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    =  "${aws_api_gateway_rest_api.user_webinar.execution_arn}/*/*"
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

resource "aws_iam_role_policy_attachment" "lambda_policy_authorizer" {
  role       = aws_iam_role.lambda_exec_auth.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
