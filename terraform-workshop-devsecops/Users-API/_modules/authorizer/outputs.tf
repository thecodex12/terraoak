output "lambda_invoke_arn_authorizer" {
  value = aws_lambda_function.Authorizer.invoke_arn
}