provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "jdtsg" {
  name = var.security_groups
  description = "Security group for Ec2 instance"
  ingress  {
    from_port=8080
    to_port=8080
    protocol="tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress  {
    from_port=22
    to_port=22
    protocol="tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress  {
    from_port=0
    to_port=65535
    protocol="tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name= var.security_groups
  }
}

resource "aws_instance" "myinstance" {
  instance_type = var.instance_type
  ami = var.ami_id
  key_name = var.key_name
  security_groups = [var.security_groups]
  tags = {
    Name= var.tag_name
  }
}

resource "aws_eip" "myinstance" {
  vpc = true
  instance = aws_instance.myinstance.id
  tags = {
    Name = "my-elastic-ip"
  }
}