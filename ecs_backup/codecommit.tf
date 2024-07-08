# Create a CodeCommit repository
resource "aws_codecommit_repository" "my_repo" {
  repository_name = "fastapi-deploy"
  description     = "This is the Sample App Repository"
  # kms_key_id      = aws_kms_key.example.arn
}
