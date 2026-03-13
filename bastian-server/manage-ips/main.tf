# Data source to get the bastion security group
data "aws_security_group" "bastion" {
  id = var.bastion_security_group_id
}

# Security group rules for SSH access - one rule per CIDR block
resource "aws_security_group_rule" "ssh_ingress" {
  for_each = var.ssh_cidr_blocks
  
  type              = "ingress"
  from_port         = var.common_ssh_port
  to_port           = var.common_ssh_port
  protocol          = "tcp"
  cidr_blocks       = [each.value.cidr_block]
  description       = each.value.description
  security_group_id = data.aws_security_group.bastion.id
  
  # Adding lifecycle rule to prevent conflicts
  lifecycle {
    create_before_destroy = true
  }
}

# Optional: Remove any existing SSH rules that are not managed by this configuration
# This is commented out by default to prevent accidental deletion of existing rules
# Uncomment and run with caution if you want this configuration to be the single source of truth

# data "aws_security_group" "current_bastion" {
#   id = local.bastion_sg_id
# }
# 
# resource "aws_security_group_rule" "cleanup_ssh_rules" {
#   count = length([for rule in data.aws_security_group.current_bastion.ingress : rule if rule.from_port == var.common_ssh_port && rule.to_port == var.common_ssh_port && rule.protocol == "tcp"])
#   
#   type              = "ingress"
#   from_port         = var.common_ssh_port  
#   to_port           = var.common_ssh_port
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]  # This would need to be dynamic based on existing rules
#   security_group_id = local.bastion_sg_id
#   
#   lifecycle {
#     prevent_destroy = true
#   }
# }