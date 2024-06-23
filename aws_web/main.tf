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

resource "aws_kms_key" "example" {
  description             = "example"
  deletion_window_in_days = 7
}

resource "aws_cloudwatch_log_group" "example" {
  name = "example"
}
