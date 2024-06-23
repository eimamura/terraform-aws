# # Create a application load balancer
# resource "aws_lb" "my_lb" {
#   name               = "my-lb"
#   load_balancer_type = "application"
#   subnets            = [aws_subnet.my_subnet.id]
# }
