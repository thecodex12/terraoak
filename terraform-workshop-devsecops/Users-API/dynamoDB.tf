resource "aws_dynamodb_table" "Users" {
  # oak9: Define asset inventory tags
  name           = "Users"
  billing_mode   = "PROVISIONED"
  hash_key       = "id"
  read_capacity  = 20 # Must be configured
  write_capacity = 20 # Must be configured

  attribute {
    name = "id"
    type = "N"
  }
  
}


