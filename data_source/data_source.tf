data "aws_vpcs" "all" {
}

output "all_vpc_ids" {
  value = data.aws_vpcs.all.ids
}