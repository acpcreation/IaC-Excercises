resource "aws_launch_template" "this" {
  for_each = var.launch_templates

  name = each.value.name
  tags = each.value.tags
}