resource "aws_iam_role" "codepipeline_role" {
  name = "my-code-pipeline-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AWSCodeBuildDeveloperAccess",
    "arn:aws:iam::aws:policy/AWSCodeCommitPowerUser",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonECS_FullAccess",
  ]
}

resource "aws_iam_role" "event_rule_role" {
  name = "event-rule-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaRole"
  ]
}


resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "codepipeline_policy"
  role = aws_iam_role.codepipeline_role.id

  # jsonencode
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          # "s3:GetObject",
          # "s3:GetObjectVersion",
          # "s3:GetBucketVersioning",
          # "s3:PutObjectAcl",
          # "s3:PutObject",
          # "s3:ListBucket",
          # "s3:ListObjects"
          "s3:*"
        ]
        Effect = "Allow"
        Resource = [
          "*"
          # aws_s3_bucket.codepipeline_bucket.arn,
          # "${aws_s3_bucket.codepipeline_bucket.arn}/*"
        ]
      },
      {
        Action   = ["codecommit:*"]
        Effect   = "Allow"
        Resource = ["*"]
      },
      {
        Action   = ["codebuild:*"]
        Effect   = "Allow"
        Resource = ["*"]
      },
      {
        Effect = "Allow",
        Action = [
          "kms:Decrypt", // Include if using KMS encryption
        ],
        Resource = "*",
        Condition = {
          StringEquals = {
            "kms:EncryptionContext:aws:aws:codepipeline:jobId" = "codepipeline-job-*"
          }
        }
      }
    ]
  })
}
