variable "name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}

variable "min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  type        = number
}

variable "vpc_zone_identifier" {
  description = "List of subnet IDs for the Auto Scaling Group"
  type        = list(string)
}

variable "capacity_rebalance" {
  description = "Whether capacity rebalance is enabled"
  type        = bool
}

variable "default_cooldown" {
  description = "Default cooldown period in seconds"
  type        = number
}

variable "health_check_grace_period" {
  description = "Health check grace period in seconds"
  type        = number
}

variable "health_check_type" {
  description = "Health check type (EC2 or ELB)"
  type        = string
}

variable "new_instances_protected_from_scale_in" {
  description = "Whether new instances are protected from scale in"
  type        = bool
}

variable "service_linked_role_arn" {
  description = "ARN of the service-linked role for the ASG"
  type        = string
}

variable "termination_policies" {
  description = "List of termination policies"
  type        = list(string)
}

variable "enabled_metrics" {
  description = "List of metrics to collect"
  type        = list(string)
}

variable "mixed_instances_policy_launch_template_id" {
  description = "ID of the launch template for mixed instances policy"
  type        = string
}

variable "mixed_instances_policy_launch_template_version" {
  description = "Version of the launch template for mixed instances policy"
  type        = string
}

variable "mixed_instances_policy_override_instance_type" {
  description = "Instance type override in mixed instances policy"
  type        = string
}

variable "tag_eks_cluster_name" {
  description = "Value for eks:cluster-name tag"
  type        = string
}

variable "tag_k8s_autoscaler_eks_ms" {
  description = "Value for k8s.io/cluster-autoscaler/eks-ms tag"
  type        = string
}

variable "tag_kubernetes_cluster_eks_ms" {
  description = "Value for kubernetes.io/cluster/eks-ms tag"
  type        = string
}

variable "tag_eks_nodegroup_name" {
  description = "Value for eks:nodegroup-name tag"
  type        = string
}

variable "tag_k8s_autoscaler_enabled" {
  description = "Value for k8s.io/cluster-autoscaler/enabled tag"
  type        = string
}