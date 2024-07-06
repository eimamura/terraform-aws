resource "aws_s3_bucket" "example" {
  bucket        = "codebuild-example-bucket"
  force_destroy = true
}
