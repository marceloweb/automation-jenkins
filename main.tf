terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.17"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami = "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
  count = 1
  key_name = "tutorial"

  tags = {
    Name = "myWebInstance"
  }

  provisioner "local-exec" {
     command = "pwd && ls -la && cat tutorial.pem"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("tutorial.pem")}"
    host        = "${self.public_ip}"
  }

  provisioner "remote-exec" {
     inline = [
        "sudo python get-pip.py",
        "sudo python -m pip install ansible"
     ]
  }
}

output "instance_ips" {
  value = aws_instance.web.*.public_ip
}
