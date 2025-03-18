resource "aws_s3_bucket" "dev_bkt_tf" {
  bucket = "state-file-config-tf"
}

# creating DynamoDB to apply statefile locking
# resource "aws_dynamodb_table" "dynamodb_tf_state_lock" {
#   name           = "terraform-lock"
#   hash_key       = "LockID"
#   read_capacity  = 20
#   write_capacity = 20
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }
resource "aws_dynamodb_table" "dynamodb_tf_state_lock" {
  name           = "terraform-lock"
  hash_key       = "LockID"
  billing_mode = "PAY_PER_REQUEST" # AWS auto-scales read/write capacity
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "terraform-state-lock"
    Environment = "dev"
  }
}