resource "aws_vpc" "web_app_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "web_app_vpc"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.web_app_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.web_app_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "web_app_igw" {
  vpc_id = aws_vpc.web_app_vpc.id

  tags = {
    Name = "web_app_igw"
  }
}

resource "aws_route_table" "web_app_public_route_table" {
  vpc_id = aws_vpc.web_app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web_app_igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}


resource "aws_route_table_association" "web_app_public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.web_app_public_route_table.id
}

resource "aws_nat_gateway" "web_app_nat_gateway" {
  subnet_id = aws_subnet.public_subnet_1.id
}