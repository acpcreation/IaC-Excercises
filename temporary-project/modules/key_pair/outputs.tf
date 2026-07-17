output "id" {
  description = "ID of the key pair"
  value       = aws_key_pair.this.id
}

output "key_name" {
  description = "Name of the key pair"
  value       = aws_key_pair.this.key_name
}

output "key_pair_id" {
  description = "Key pair ID"
  value       = aws_key_pair.this.key_pair_id
}