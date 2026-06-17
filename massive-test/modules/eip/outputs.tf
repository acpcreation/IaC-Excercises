output "id" {
  description = "EIP allocation ID"
  value       = aws_eip.this.id
}

output "public_ip" {
  description = "Public IP address of the EIP"
  value       = aws_eip.this.public_ip
}