resource "aws_iam_instance_profile" "this" {
  name = var.name
  path = var.path
  role = var.role
}