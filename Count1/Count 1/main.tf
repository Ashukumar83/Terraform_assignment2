terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.23.0"
    }
  }
}

resource "aws_instance" "web" {
  count = length(var.ami)
  instance_type = "t2.micro"
  ami = var.ami[count.index]

  tags = {
    Name = var.ins_name[count.index],
    #Name = "demo-instance-ashu ${count.index}",
    Owner = "Ashu Kumar"
  }
}


provider "aws"{
  region ="ap-south-1"
}

