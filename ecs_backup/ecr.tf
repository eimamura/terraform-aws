# Create an ECR repository
resource "aws_ecr_repository" "my_repository" {
  name         = "fastapi-deploy"
  force_delete = true
}


