terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket         = "my-terraform-state-bucketkds"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
  }
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
 

