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





# not recomanded 

data "aws_security_group" "dev" {
  id = "sg-0c1c94a22051c3e6e" #here change your sg id details"

}
data "aws_subnet" "dev" {
  id = "subnet-03212bd903a2f9ae8" #here chnage your subnet id details
}