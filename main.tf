terraform {
  cloud {
    organization = "rio-hashicorp"
    workspaces {
      name = "deploy-nomad-aws"
    }
  }

  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}
  provider "aws" {
    region = "us-west-2"
  }


  resource "aws_instance" "nomad-server" {
    ami = "ami-023e152801ee4846a" #Deploy Amazon Linux 2023 AMI
    count = 3
    instance_type = "t2.micro"
    key_name = "key1"

    tags = {
    Name = "nomad-server"
  }
  }

   


# Nomad
output "Nomad_Private_IP_Address" {
  value = aws_instance.nomad-dev.private_ip
}

output "Nomad_Public_IP_Address" {
  value = aws_instance.nomad-dev.public_ip
}
