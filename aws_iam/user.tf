resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.lb.name
}

data "aws_iam_policy_document" "lb_ro" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "lb_ro" {
  # User permissions = attached policy
  # Customer inline
  name   = "test"
  user   = aws_iam_user.lb.name
  policy = data.aws_iam_policy_document.lb_ro.json
}

resource "aws_iam_user_policy_attachment" "console_user_policy_attachment" {
  # AWS Managed policy
  user       = aws_iam_user.lb.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_ssh_key" "user" {
  username   = aws_iam_user.lb.name
  encoding   = "SSH"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 mytest@mydomain.com"
}

resource "aws_iam_user_login_profile" "example" {
  # Console sign-in password
  user = aws_iam_user.lb.name
  # pgp_key = "keybase:some_person_that_exists"
}
