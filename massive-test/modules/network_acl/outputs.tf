output "id" {
  description = "Network ACL IDs"
  value       = { for k, v in aws_network_acl.this : k => v.id }
}