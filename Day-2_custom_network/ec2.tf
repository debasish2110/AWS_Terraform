resource "aws_instance" "pub_ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_pair_name
  subnet_id = aws_subnet.dev_subnet.id
  associate_public_ip_address = true
  security_groups = [aws_security_group.dev_sg.id]
  tags = {
    Name = "public ec2"
  }
}

resource "aws_instance" "pvt_ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_pair_name
  subnet_id = aws_subnet.dev_pvt_subnet.id
  security_groups = [aws_security_group.dev_sg.id]
  availability_zone = "ap-south-1a"
  tags = {
    Name = "private ec2"
  }
}