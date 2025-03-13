# step-1: create a VPC
resource "aws_vpc" "dev_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "VPC_tf"
    }
  
}
# step-2: create a internet GW and attach to VPC
resource "aws_internet_gateway" "dev_igw" {
        # resource_name.local_name.attribute
    vpc_id = aws_vpc.dev_vpc.id
    tags = {
      Name = "IGW_tf"
    }
  
}

# step-3: create subnets
resource "aws_subnet" "dev_subnet" {
  vpc_id = aws_vpc.dev_vpc.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "subnet_tf"
  }
}
# step-4: create Route Tables
# step-5: edit routes
resource "aws_route_table" "dev_rt" {
  vpc_id = aws_vpc.dev_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }
  tags = {
    Name = "pub_rt_tf"
  }
}
# step-6: subnet association
resource "aws_route_table_association" "pub_rt_as" {
  route_table_id = aws_route_table.dev_rt.id
  subnet_id = aws_subnet.dev_subnet.id
}

#######################################################

# creating EIP for Nat GW
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

#creating NAT gw
resource "aws_nat_gateway" "dev_ngw" {
  subnet_id = aws_subnet.dev_subnet.id
  allocation_id = aws_eip.nat_eip.id
}

# creating private subnet
resource "aws_subnet" "dev_pvt_subnet" {
  vpc_id = aws_vpc.dev_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "private_subnet_tf"
  }
}

# creating private route table
resource "aws_route_table" "pvt_rt" {
  vpc_id = aws_vpc.dev_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.dev_ngw.id
  }
  tags = {
    Name = "private_route_table_tf"
  }
}

# private RT subnet association
resource "aws_route_table_association" "pvt_rt_as" {
  route_table_id = aws_route_table.pvt_rt.id
  subnet_id = aws_subnet.dev_pvt_subnet.id
}

# create custom Securoty group
resource "aws_security_group" "dev_sg" {
  name = "allow tls"
  vpc_id = aws_vpc.dev_vpc.id
  tags = {
    Name = "dev security group"
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] 
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
