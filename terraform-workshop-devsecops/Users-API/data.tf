
data "archive_file" "lambda_users_get" {
  type = "zip"

  source_file  = "${path.module}/python/user-get.py"
  output_path = "${path.module}/python/user-store-get.zip"
}

data "archive_file" "lambda_users_set" {
  type = "zip"

  source_file  = "${path.module}/python/user-set.py"
  output_path = "${path.module}/python/user-store-set.zip"
}

data "archive_file" "authorizer" {
  type = "zip"

  source_file  = "${path.module}/nodejs/authorizer.mjs"
  output_path = "${path.module}/nodejs/authorizer.zip"
}