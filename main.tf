provider "aws" {
  region = var.region
}

# EC2 instance configuration
resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type           = var.instance_type
  key_name               = "vockey"  # Use default key pair
  subnet_id              = aws_subnet.public_subnet.id
  security_groups        = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "Terraform-EC2"
  }
}

# VPC creation
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Subnet creation
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}

# Route Table
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Route Table Association
resource "aws_route_table_association" "route_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
}

# Security Group
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow SSH and HTTP/HTTPS"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Output EC2 instance public IP
output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}
