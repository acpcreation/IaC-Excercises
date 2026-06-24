output "id" {
  description = "Key pair IDs"
  value       = { for k, v in aws_key_pair.this : k => v.id }
}