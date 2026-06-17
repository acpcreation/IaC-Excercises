resource "aws_eip" "this" {
  domain            = var.domain
  network_interface = var.network_interface_id
  network_border_group = var.network_border_group
  public_ipv4_pool  = var.public_ipv4_pool
  tags              = var.tags
}