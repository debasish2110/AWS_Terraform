data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

resource "aws_instance" "user_data_instance" {
  ami = data.aws_ami.amzlinux.id
  instance_type = "t2.micro"
  key_name = "tf_kp"
  user_data = file("user_data.sh")   # any from templatefile or file function can be used to feed user data
  
  tags = {
    Name = "User Data"
  }
}

#####   file()   #####
    # Purpose: Reads the raw contents of a file.
    # Usage: Simply loads the file's content without any variable interpolation.
            # Variable interpolation means replacing placeholders in a string with actual values at runtime. 
            # Terraform allows you to insert variable values into strings dynamically using ${} syntax.
    # Use when you don't need to insert dynamic values.
    # Best for: Static scripts (e.g., plain shell scripts, cloud-init scripts).
    # example uses:
        # user_data = file("${path.module}/userdata.sh")

#####   templatefile()   #####
    # Purpose: Reads a file and replaces placeholders with variable values.
    # Usage: Supports templating using ${} syntax.
    # Best for: Dynamic scripts where you need to insert values like instance ID, region, or other Terraform variables.
    # example uses:
        # user_data = templatefile("${path.module}/userdata.tpl", {
        #   instance_name = "my-instance"
        #   region        = "us-east-1"
        # })

        ####### userdata.tpl #######
            # /bin/bash
            # echo "Instance Name: ${instance_name}"
            # echo "Region: ${region}"
        ## proccessed output ##
            # #/bin/bash
            # echo "Instance Name: my-instance"
            # echo "Region: us-east-1"

#########
# Feature	                        |  .tpl (Template File)	                        |  .sh (Shell Script)
# Purpose	                        | Template for dynamic content with Terraform	| Static shell script
# Used With	                        | templatefile()	                            | file()
# Supports Variable Interpolation?	|✅ Yes (${} syntax)	                           |❌ No
# When to Use?	                    |When you need to insert Terraform variables dynamically | When the script is static with no Terraform-specific values


output "public_ip" {
  value = aws_instance.user_data_instance.public_ip
}

output "public_dns" {
  value = aws_instance.user_data_instance.public_dns
}