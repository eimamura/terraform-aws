resource "aws_ecs_service" "backend_service" {
  name            = "backend-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.backend_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = aws_subnet.my_subnet.*.id
    security_groups  = [aws_security_group.example.id]
    assign_public_ip = true
  }

  # load_balancer {
  #   target_group_arn = aws_lb_target_group.example.arn
  #   container_name   = "backend"
  #   container_port   = 80
  # }
}
