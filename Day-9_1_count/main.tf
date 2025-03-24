# resource "aws_instance" "test_count" {
#   ami = "ami-05c179eced2eb9b5b"
#   instance_type = "t2.micro"
#   count = 2
#   tags = {
#     Name = "dev.${count.index}"  # execute 0... count, check "terraform plan" to get the understanding
#   }
# }

variable "ami" {
  type    = string
  default = "ami-05c179eced2eb9b5b"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "sandboxes" {
  type    = list(string)
  default = ["dev", "test", "prod"]
}

resource "aws_instance" "test_count" {
  ami = var.ami
  instance_type = var.instance_type
  count = length(var.sandboxes)          # calculates the number of sandboxes/servers
#   tags = {
#     Name = "dev.${count.index}"  # execute 0... count, check "terraform plan" to get the understanding
#   }
  tags = {
    Name = var.sandboxes[count.index]    # fetching the sandboxes/servers from list, one by one using indices
  }
}
