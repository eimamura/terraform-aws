output "my-vm-public-ip" {
  value = aws_instance.my_vm_public[*].public_ip
}
output "my-vm-private-ip" {
  value = aws_instance.my_vm_private[*].private_ip
}
# output "my-db" {
#   value = aws_db_instance.dbserver.endpoint
# }
# output "my-s3-bucket" {
#   value = aws_s3_bucket.example.bucket_domain_name
# }
output "my-aurora-cluster" {
  value = aws_rds_cluster.example.endpoint
}
