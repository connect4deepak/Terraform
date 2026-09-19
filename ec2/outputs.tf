output "aws_instance_public_IP" {
  value = aws_instance.first_instance.public_ip
  description = "The public IP address of the AWS instance."
}