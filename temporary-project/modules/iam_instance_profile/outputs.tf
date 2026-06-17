output "id" {
  description = "ID of the IAM instance profile"
  value       = aws_iam_instance_profile.this.id
}

output "arn" {
  description = "ARN of the IAM instance profile"
  value       = aws_iam_instance_profile.this.arn
}

output "name" {
  description = "Name of the IAM instance profile"
  value       = aws_iam_instance_profile.this.name
}