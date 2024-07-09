output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_public_id" {
  value       = aws_subnet.public.id
  description = "value of the public subnet ID"
}

output "subnet_private_id" {
  value       = aws_subnet.private.id
  description = "value of the private subnet ID"
}
