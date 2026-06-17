output "id" {
  description = "ID of the instance"
  value       = aws_instance.this.id
}

output "arn" {
  description = "ARN of the instance"
  value       = aws_instance.this.arn
}

output "private_ip" {
  description = "Private IP address of the instance"
  value       = aws_instance.this.private_ip
}

output "public_ip" {
  description = "Public IP address of the instance"
  value       = aws_instance.this.public_ip
}