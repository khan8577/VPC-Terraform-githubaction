output "vpc_id" {
    value = aws_vpc.test_vpc.id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = aws_subnet.subnets.*.id
}