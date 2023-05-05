resource "aws_s3_bucket" "lambda_bucket" {
  # oak9: Define asset inventory tags
  # oak9: Define asset inventory tags
  bucket =  "terraformnew-webinar-demo-files"

  force_destroy = true
}

resource "aws_s3_object" "lambda_users_get" {
  bucket = aws_s3_bucket.lambda_bucket.id

  key    = "user-store-get.zip"
  source = data.archive_file.lambda_users_get.output_path
  etag = filemd5(data.archive_file.lambda_users_get.output_path)
}

resource "aws_s3_object" "lambda_users_set" {
  bucket = aws_s3_bucket.lambda_bucket.id

  key    = "user-store-set.zip"
  source = data.archive_file.lambda_users_set.output_path
  etag = filemd5(data.archive_file.lambda_users_set.output_path)
}

resource "aws_s3_object" "authorizer" {
  bucket = aws_s3_bucket.lambda_bucket.id

  key    = "authorizer.zip"
  source = data.archive_file.authorizer.output_path
  etag = filemd5(data.archive_file.authorizer.output_path)
}
