output "id" {
  description = "EC2 instance IDs"
  value       = { for k, v in aws_instance.this : k => v.id }
}