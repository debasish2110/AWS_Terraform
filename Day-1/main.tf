# contains resource details
# resource "resource type" "local name" {}
resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_pair_name
    tags = {
        Name = "Terraform-EC2"
    }
}