resource "aws_codebuild_project" "codebuild_project" {
  name           = "codebuild-project"
  description    = "CodeBuild project for FastAPI deploy"
  build_timeout  = 5
  queued_timeout = 5

  service_role = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  cache {
    type  = "LOCAL"
    modes = ["LOCAL_DOCKER_LAYER_CACHE", "LOCAL_SOURCE_CACHE"]
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "SOME_KEY1"
      value = "SOME_VALUE1"
    }
  }

  # source {
  #   type            = "CODECOMMIT"
  #   location        = "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/fastapi-deploy"
  #   git_clone_depth = 1
  # }
  source {
    type            = "GITHUB"
    location        = "https://github.com/eimamura/fastapi-deploy.git"
    git_clone_depth = 1
    buildspec       = "buildspec.yml"
    # https://docs.aws.amazon.com/codebuild/latest/userguide/access-tokens.html#access-tokens-github
    # Foi feito oauth para o github manulamente pelo console do codebuild
    # auth {
    #   type     = "OAUTH"
    #   resource = "eimamura/fastapi-deploy"
    # }
  }

  tags = {
    Environment = "Test"
  }
}
