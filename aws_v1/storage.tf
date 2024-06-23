# resource "aws_s3_bucket" "example" {
#   bucket = "my-tf-test-bucket-dvgdgf"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_vpc_endpoint" "s3_endpoint" {
#   vpc_id       = aws_vpc.main.id
#   service_name = "com.amazonaws.us-east-1.s3"
#   tags = {
#     Environment = "test"
#   }
# }

# resource "aws_vpc_endpoint_route_table_association" "private_s3" {
#   vpc_endpoint_id = aws_vpc_endpoint.s3_endpoint.id
#   route_table_id  = aws_route_table.second_rt.id
# }
