output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_public_id" {
  value       = aws_subnet.public.id
  description = "value of the public subnet ID"
}

output "subnet_public_cidr_block" {
  value       = aws_subnet.public.cidr_block
  description = "value of the public subnet CIDR block"
}

output "subnet_private_id" {
  value       = aws_subnet.private.id
  description = "value of the private subnet ID"
}

output "subnet_private_id2" {
  value       = aws_subnet.private2.id
  description = "value of the private subnet ID"
}
