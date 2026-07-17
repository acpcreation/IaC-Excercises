output "id" {
  description = "ID of the network interface"
  value       = aws_network_interface.this.id
}

output "arn" {
  description = "ARN of the network interface"
  value       = aws_network_interface.this.arn
}