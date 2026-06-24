resource "aws_instance" "this" {
  for_each = var.instances

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  availability_zone      = each.value.availability_zone
  key_name               = each.value.key_name
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.vpc_security_group_ids
  iam_instance_profile   = each.value.iam_instance_profile
  source_dest_check      = each.value.source_dest_check
  tenancy                = each.value.tenancy
  monitoring             = each.value.monitoring
  tags                   = each.value.tags
}