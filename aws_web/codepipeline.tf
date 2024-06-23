# # Create a CodePipeline
# resource "aws_codepipeline" "my_pipeline" {
#   name     = "my-pipeline"
#   role_arn = aws_iam_role.my_role.arn

#   artifact_store {
#     location = aws_s3_bucket.my_bucket.bucket
#     type     = "S3"

#     encryption_key {
#       id   = data.aws_kms_alias.s3kmskey.arn
#       type = "KMS"
#     }
#   }

#   stage {
#     name = "Source"

#     action {
#       name             = "SourceAction"
#       category         = "Source"
#       owner            = "AWS"
#       provider         = "CodeCommit"
#       version          = "1"
#       output_artifacts = ["SourceArtifact"]

#       configuration = {
#         RepositoryName = aws_codecommit_repository.my_repo.repository_name
#         BranchName     = "main"
#       }
#     }
#   }

#   stage {
#     name = "Build"

#     action {
#       name             = "BuildAction"
#       category         = "Build"
#       owner            = "AWS"
#       provider         = "CodeBuild"
#       version          = "1"
#       input_artifacts  = ["SourceArtifact"]
#       output_artifacts = ["BuildArtifact"]

#       configuration = {
#         ProjectName = aws_codebuild_project.my_project.name
#       }
#     }
#   }
# }


