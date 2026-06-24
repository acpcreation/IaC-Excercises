resource "aws_iam_role" "this" {
  name                 = var.name
  path                 = var.path
  description          = var.description
  assume_role_policy   = var.assume_role_policy
  max_session_duration = var.max_session_duration
}