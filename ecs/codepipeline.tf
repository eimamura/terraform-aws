
module "codepipeline" {
  source             = "./codepipeline"
  repository_name    = aws_codecommit_repository.my_repo.repository_name
  build_project_name = aws_codebuild_project.codebuild_project.name
  ecs_cluster_name   = aws_ecs_cluster.ecs_cluster.name
  ecs_service_name   = aws_ecs_service.backend_service.name
}
