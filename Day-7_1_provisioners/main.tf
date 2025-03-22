provider "aws" {
  region = "ap-south-1"
}

# make sure .ssh folder should be present at ur user path "/c/Users/debas"
# generate ssh key if no pub and private key present inside .ssh folder
# resource "aws_key_pair" "tf_kp" {
#     key_name = "terraform_key"
#     public_key = file("~/.ssh/id_rsa.pub")
# }

resource "aws_instance" "tf_server" {
    ami = "ami-08fe5144e4659a3b3"
    instance_type = "t2.micro"
    # key_name = aws_key_pair.tf_kp.key_name
    key_name = "terraform_key"
    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host = self.public_ip
    }

    provisioner "local-exec" {
      command = "touch file_local.txt"
    }

    provisioner "file" {
      source = "file_provisioner.txt"
      destination = "/home/ec2-user/file_provisioner.txt"
    }

    provisioner "remote-exec" {
      inline = [ 
        "touch file_remote.txt",
        "echo executed in aws > file_remote.txt"
       ]
    }
}

