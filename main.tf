terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami = "ami-0c6b1d09930fac512"
  instance_type = "t2.micro"
  count = 1
  key_name = "tutorial"

  tags = {
    Name = "myWebInstance"
  }
}

output "instance_ips" {
  value = aws_instance.web.*.public_ip
}
