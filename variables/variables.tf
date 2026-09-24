variable "instance_type" {
   type        = string
   description = "The type of AWS instance to create."
   validation {
     condition = var.instance_type=="t2.micro" || var.instance_type=="t2.small"
     error_message = "only micro and small server"
   }
 }

#  variable "ami" {
#   type = string
#   description = "the ami"
#   default = "ami-06468be052a4195a6"
   
#  }

#  variable "instance_name" {
#   type = string
#   description = "name"
#   default = "variable_instance"
   
#  }

 variable "instance_config" {
  description = "this is variable for instance config"
  type = object({
    name = string
    ami = string
  })
  default = {
    name = "variable_instance"
    ami = "ami-06468be052a4195a6"
  }
 }

 variable "additional_tag" {
  description = "this is a additional tag"
  type = map(string)
  default = {
    "team" = "new"
    "env" = "test"
  }
 }


# locals {
#   name = "king"
# }