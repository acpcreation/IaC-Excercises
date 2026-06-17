resource "aws_iam_role" "this" {
  assume_role_policy   = var.assume_role_policy
  description          = var.description
  max_session_duration = var.max_session_duration
  name                 = var.name
  path                 = var.path
}