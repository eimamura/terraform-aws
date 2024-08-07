resource "aws_ecs_cluster" "ecs_cluster" {
  name = "my-ecs-cluster"

  configuration {
    execute_command_configuration {
      #   kms_key_id = aws_kms_key.example.arn
      logging = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.cloudwatch_log_group.name
      }
    }
  }

}

# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/stopped-task-errors.html
