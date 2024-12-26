provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "jdtsg" {
  name = "jdt_sg"

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
}

resource "aws_instance" "myinstance" {
  instance_type = "t2.micro"
  ami = "ami-0fd05997b4dff7aac"
  key_name = "keypair1"
  security_groups = [aws_security_group.jdtsg.id]
  tags = {
    Name= "jdtinstance"
  }
}

resource "aws_eip" "myinstance" {
  vpc = true
  instance = aws_instance.myinstance.id
  tags = {
    Name = "my-elastic-ip"
  }
}