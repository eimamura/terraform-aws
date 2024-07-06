# aws_iam_role
Provides an IAM role.
- assume_role_policy (trust relationship)
- inline_policy
- managed_policy_arns

# aws_iam_policy  (policy)
Customer managed policy

# aws_iam_role_policy (role, policy)
Customer Role inline policy

# aws_iam_role_policy_attachment (role, policy)
Attaches a Managed IAM Policy to an IAM role

# aws_iam_policy_attachment (user, role, group, policy)
Attaches a Managed IAM Policy to user(s), role(s), and/or group(s)

# Policy Types:
- AWS managed
- Customer managed or inline (data aws_iam_policy_document or jsonencode())
