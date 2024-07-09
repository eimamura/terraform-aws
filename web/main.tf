terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.55"
    }
  }
  required_version = ">= 1.8.4"
}

provider "aws" {
  region = "us-east-1"
}
