output "iam_role_arn" {
  description = "ARN of the IAM role"
  value       = module.iam_role.arn
}

output "iam_role_name" {
  description = "Name of the IAM role"
  value       = module.iam_role.name
}