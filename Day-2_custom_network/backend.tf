terraform {
  backend "s3" {
    bucket = "state-file-config-tf"
    key = "terraform.tfstate"
    region = "ap-south-1"
  }
}