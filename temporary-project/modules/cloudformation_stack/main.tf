resource "aws_cloudformation_stack" "this" {
  name             = var.name
  capabilities     = var.capabilities
  disable_rollback = var.disable_rollback
  parameters       = var.parameters
}