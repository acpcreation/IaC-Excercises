resource "aws_cloudformation_stack" "this" {
  for_each = var.cloudformation_stacks

  name             = each.value.name
  capabilities     = each.value.capabilities
  disable_rollback = each.value.disable_rollback
  parameters       = each.value.parameters
}