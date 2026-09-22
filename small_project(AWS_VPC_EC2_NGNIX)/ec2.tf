resource "aws_instance" "nginx_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.my_security_group.id]
  associate_public_ip_address = true
  
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF

  tags = {
    Name = var.instance_name
  }
}