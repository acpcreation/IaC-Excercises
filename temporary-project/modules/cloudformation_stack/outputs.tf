output "id" {
  description = "ID of the CloudFormation stack"
  value       = aws_cloudformation_stack.this.id
}

output "outputs" {
  description = "Outputs from the CloudFormation stack"
  value       = aws_cloudformation_stack.this.outputs
}