# Create a CodeCommit repository
resource "aws_codecommit_repository" "my_repo" {
  repository_name = "my-repo"
  description     = "This is the Sample App Repository"
  kms_key_id      = aws_kms_key.example.arn
}
