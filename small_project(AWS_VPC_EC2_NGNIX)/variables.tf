variable "region" {
   type        = string
   description = "The AWS region to deploy the instance."
   default     = "eu-west-1"
 }

 variable "instance_type" {
   type        = string
   description = "The type of AWS instance to create."
   default     = "t2.nano"
 }

 variable "ami" {
   type        = string
   description = "The AMI ID to use for the instance."
   default     = "ami-06468be052a4195a6"
 }

 variable "instance_name" {
   type        = string
   description = "The name tag for the AWS instance."
   default     = "first_instance_terraform"
 }

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

