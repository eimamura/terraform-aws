# # Create an ECS cluster
# resource "aws_ecs_cluster" "my_cluster" {
#   name = "my-cluster"

#   configuration {
#     execute_command_configuration {
#       kms_key_id = aws_kms_key.example.arn
#       logging    = "OVERRIDE"

#       log_configuration {
#         cloud_watch_encryption_enabled = true
#         cloud_watch_log_group_name     = aws_cloudwatch_log_group.example.name
#       }
#     }
#   }
# }
