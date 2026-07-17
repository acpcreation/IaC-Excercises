output "id" {
  description = "Launch template IDs"
  value       = { for k, v in aws_launch_template.this : k => v.id }
}