# variables defined in terraform.tfvars
variable "ami_id" {
  description = "passing AMI value to main.tf"
  type = string
  default = ""
}

variable "instance_type" {
    description = "instance type of EC2 instance"
    type = string
    default = ""
  
}

variable "key_pair_name" {
    description = "key pair name"
    type = string
    default = ""
  
}