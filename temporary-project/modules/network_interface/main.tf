resource "aws_network_interface" "this" {
  subnet_id         = var.subnet_id
  description       = var.description
  source_dest_check = var.source_dest_check
  security_groups   = var.security_groups
  tags              = var.tags
}