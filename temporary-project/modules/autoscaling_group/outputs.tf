output "id" {
  description = "ID of the autoscaling group"
  value       = aws_autoscaling_group.this.id
}

output "arn" {
  description = "ARN of the autoscaling group"
  value       = aws_autoscaling_group.this.arn
}