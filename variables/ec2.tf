
locals {
  name = "king"
}

resource "aws_instance" "first_instance" {
  ami           = var.instance_config.ami
  instance_type = var.instance_type
  tags = merge(var.additional_tag, {
    Name = local.name
    ami = var.instance_config.ami
   }
  )
}
