output "id" {
  description = "Workgroup name (ID)"
  value       = { for k, v in aws_athena_workgroup.this : k => v.id }
}