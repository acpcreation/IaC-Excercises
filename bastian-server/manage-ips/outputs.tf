output "bastion_security_group_id" {
  description = "ID of the bastion security group being managed"
  value       = data.aws_security_group.bastion.id
}

output "managed_ssh_rules" {
  description = "SSH CIDR blocks being managed by this configuration"
  value = {
    for key, cidr in var.ssh_cidr_blocks : key => {
      cidr_block  = cidr.cidr_block
      description = cidr.description
    }
  }
}

output "ssh_port" {
  description = "SSH port configured for access"
  value       = var.common_ssh_port
}

output "security_group_arn" {
  description = "ARN of the bastion security group"
  value       = data.aws_security_group.bastion.arn
}