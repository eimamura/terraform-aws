resource "aws_iam_group" "group" {
  name = "test-group"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.lb.name,
  ]

  group = aws_iam_group.group.name
}

