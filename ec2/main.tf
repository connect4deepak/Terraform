terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.2"
    }
  }
}

resource "random_id" "instance_id" {
  byte_length = 8
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

resource "aws_instance" "first_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
  Name = var.instance_name
  }
}

