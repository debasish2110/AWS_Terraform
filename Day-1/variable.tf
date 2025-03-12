variable "ami_id" {
  description = "passing AMI value to main.tf"
  type = string
  default = "ami-05c179eced2eb9b5b"
}

variable "instance_type" {
    description = "instance type of EC2 instance"
    type = string
    default = "t2.micro"
  
}

variable "key_pair_name" {
    description = "key pair name"
    type = string
    default = "tf_kp"
  
}