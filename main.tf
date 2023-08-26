terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_key_pair" "example_keypair" {
  key_name   = "example-keypair"
  public_key = tls_private_key.example.public_key_openssh
}

resource "aws_instance" "app_server" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  key_name = aws_key_pair.example_keypair.key_name

  tags = {
    Name = "ec2_server_with_jenkins"
  }
}

output "instance_ip" {
  value = aws_instance.app_server.public_ip
}

resource "tls_private_key" "example" {
  algorithm = "RSA"
}

resource "null_resource" "install_jenkins" {
  depends_on = [aws_instance.app_server]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install openjdk-11-jdk -y",
      "sudo apt update",
      "curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee  /usr/share/keyrings/jenkins-keyring.asc > /dev/null",
      "echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]    https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null",
      "sudo apt-get update",
      "sudo apt-get install jenkins -y",

      "sudo apt update",
      "sudo apt install openjdk-11-jre -y",
      "sudo apt update",
      "curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee  /usr/share/keyrings/jenkins-keyring.asc > /dev/null",
      "echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]    https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null",
      "sudo apt-get update",
      "sudo apt-get install jenkins -y",
                   
    ]

    



    connection {
      host        = aws_instance.app_server.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.example.private_key_pem
    }
  }
}

terraform {
  backend "s3" {
    bucket = "storage010"  # bucket name should be same as the existing
    key    = "terraform/state.tfstate"
    region = "us-east-1"  # Change this to your desired region
  }
  }
