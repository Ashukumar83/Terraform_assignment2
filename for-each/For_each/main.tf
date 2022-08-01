terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.23.0"
    }
  }
}

provider "aws"{
  region ="ap-south-1"
}

#for_each using map
resource "aws_instance" "app_server" {
  for_each = var.loop_name
  ami = "ami-08df646e18b182346"
  instance_type = "t2.micro"

  tags = {
    Name = each.value,
    Owner = each.key
  }
}



