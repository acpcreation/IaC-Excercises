output "bastion_public_ip" {
  description = "Public IP of the bastion server"
  value       = aws_eip.bastion.public_ip
}

output "bastion_private_ip" {
  description = "Private IP of the bastion server"
  value       = aws_instance.bastion.private_ip
}

output "bastion_instance_id" {
  description = "Instance ID of the bastion server"
  value       = aws_instance.bastion.id
}

output "bastion_security_group_id" {
  description = "Security group ID of the bastion server"
  value       = aws_security_group.bastion.id
}

output "bastion_subnet_id" {
  description = "Subnet ID where the bastion server is deployed"
  value       = aws_instance.bastion.subnet_id
}

output "ssh_connection_info" {
  description = "Information to connect to the bastion server"
  value       = "Connect to: ec2-user@${aws_eip.bastion.public_ip} (Note: No key pair configured - use Session Manager or configure access separately)"
}

output "ssh_cidr_source" {
  description = "Source of the SSH CIDR blocks (security group ID or 'variable')"
  value       = var.source_security_group_id != "" ? "Security Group: ${var.source_security_group_id}" : "Variable: allowed_ssh_cidr_blocks"
}

output "bastion_ssh_ingress_rules" {
  description = "SSH ingress rules details from the bastion security group"
  value = [
    for rule in aws_security_group.bastion.ingress :
    {
      from_port   = rule.from_port
      to_port     = rule.to_port
      protocol    = rule.protocol
      cidr_blocks = rule.cidr_blocks
      description = rule.description
    }
    if rule.from_port == 22 && rule.to_port == 22
  ]
}