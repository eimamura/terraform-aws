resource "aws_iam_role" "example_managed" {
  name               = "yak_role_managed"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json # (not shown)

  managed_policy_arns = [
    aws_iam_policy.policy_one.arn,
    aws_iam_policy.policy_two.arn,
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess", # AWS managed policy
  ]
}

resource "aws_iam_role_policy" "policy_role" {
  # Customer inline policy
  name = "test_policy_role"
  role = aws_iam_role.example_managed.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}



resource "aws_iam_policy" "policy_one" {
  # Customer managed policy
  name = "policy-618033"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["ec2:Describe*"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy" "policy_two" {
  # Customer managed policy
  name = "policy-381966"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:ListAllMyBuckets", "s3:ListBucket", "s3:HeadBucket"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
