resource "aws_key_pair" "this" {
  for_each = var.key_pairs

  key_name   = each.value.key_name
  public_key = each.value.public_key
}