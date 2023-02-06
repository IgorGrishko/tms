output "vpc" {
  value = aws_vpc.vpc.id
}

output "subnets_public" {
  value = aws_subnet.public.*.id
}

output "subnets_private" {
  value = aws_subnet.private.*.id
}

output "security_group_private" {
  value = aws_security_group.private.id
}

output "security_group_public" {
  value = aws_security_group.public.id
}

output "network_avialability_zones" {
  value = data.aws_availability_zones.available.names
}
