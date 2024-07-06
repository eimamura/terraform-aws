resource "aws_s3_bucket" "codebuild_bucket" {
  bucket        = "codebuild-example-bucket"
  force_destroy = true
}
