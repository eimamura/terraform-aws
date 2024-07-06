variable "repository_name" {
  description = "Name of the AWS CodeCommit repository"
  type        = string
  default     = "my-repo"
}

variable "build_project_name" {
  description = "Name of the AWS CodeBuild project"
  type        = string
  default     = "project-with-cache"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "my-cluster"
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  type        = string
  default     = "my-service"
}

variable "ecr_repository_url" {
  description = "URL of the ECR repository"
  type        = string
  default     = "123456789012.dkr.ecr.us-east-1.amazonaws.com/my-repo"
}
