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

resource "aws_instance" "test" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    tags = {
      Name = "Depndent instance"
    }
}

resource "aws_s3_bucket" "test" {
    bucket = "dependency-block-check-by-debashish"
    depends_on = [aws_instance.test]  # first instance will be created then
}

# destroying also, the instance willbe destroyed first