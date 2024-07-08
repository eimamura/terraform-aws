resource "aws_ecs_task_definition" "backend_task_definition" {
  family = "backend-task"
  container_definitions = jsonencode([
    {
      name      = "fastapi-deploy"
      image     = aws_ecr_repository.my_repository.repository_url
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
}
