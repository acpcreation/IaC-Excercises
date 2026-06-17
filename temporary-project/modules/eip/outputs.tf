output "id" {
  description = "ID of the EIP"
  value       = aws_eip.this.id
}

output "public_ip" {
  description = "Public IP address of the EIP"
  value       = aws_eip.this.public_ip
}

output "allocation_id" {
  description = "Allocation ID of the EIP"
  value       = aws_eip.this.allocation_id
}