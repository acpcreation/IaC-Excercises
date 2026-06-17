output "id" {
  description = "Internet gateway IDs"
  value       = { for k, v in aws_internet_gateway.this : k => v.id }
}