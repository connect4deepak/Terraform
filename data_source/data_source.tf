data "aws_vpcs" "all" {
    tags = {
        Name = "my-vpc"
    }
}

output "all_vpc_ids" {
  value = data.aws_vpcs.all.ids

}

data "aws_ami" "all" {
    most_recent = true
    owners      = ["amazon"]
}

output "all_ami_ids" {
  value = data.aws_ami.all.id
}
data "aws_security_groups" "all" {
  filter {
    name   = "group-name"
    values = ["my-security-group"]
  }
}

output "all_security_group_ids" {
  value = data.aws_security_groups.all.ids
}

data "aws_availability_zones" "all" {
}

output "all_availability_zone_names" {
  value = data.aws_availability_zones.all.names
}

data "aws_caller_identity" "name" {
}

output "current_account_id" {
  value = data.aws_caller_identity.name
}

data "aws_region" "current" {
}       

output "current_region_name" {
  value = data.aws_region.current.region
}

data "aws_subnets" "all" {
    tags = {
        Name = "private-subnet"
    }
}

output "all_subnet_ids" {
  value = data.aws_subnets.all.ids
}