output "id" {
  description = "ID of the internet gateway"
  value       = aws_internet_gateway.this.id
}

output "arn" {
  description = "ARN of the internet gateway"
  value       = aws_internet_gateway.this.arn
}