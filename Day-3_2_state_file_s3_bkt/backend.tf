terraform {
  backend "s3" {
    bucket = "state-file-config-tf"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt = true    # ensures state is encrypted at rest in S3
  }
}