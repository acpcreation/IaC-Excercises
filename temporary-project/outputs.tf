output "athena_workgroup_arns" {
  description = "ARNs of all Athena workgroups"
  value       = [for wg in module.athena_workgroup : wg.arn]
}

output "autoscaling_group_id" {
  description = "ID of the autoscaling group"
  value       = module.autoscaling_group.id
}

output "autoscaling_group_arn" {
  description = "ARN of the autoscaling group"
  value       = module.autoscaling_group.arn
}

output "eip_public_ip" {
  description = "Public IP of the EIP"
  value       = module.eip_basic_eks_eu_central_1a.public_ip
}

output "eip_allocation_id" {
  description = "Allocation ID of the EIP"
  value       = module.eip_basic_eks_eu_central_1a.allocation_id
}

output "key_pair_id" {
  description = "ID of the key pair"
  value       = module.key_pair_private_runner_workshop.id
}