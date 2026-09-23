resource "aws_instance" "data_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  availability_zone = data.aws_availability_zones.all.names[1]
  vpc_security_group_ids = [data.aws_security_groups.all.ids[0]]
  subnet_id     = data.aws_subnets.all.ids[0]
  tags = {
    Name = "data_instance"
  }
  
}