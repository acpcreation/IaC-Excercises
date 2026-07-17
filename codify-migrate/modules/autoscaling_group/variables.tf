variable "name" {
  type        = string
  description = "Name of the Auto Scaling Group"
}

variable "max_size" {
  type        = number
  description = "Maximum size of the Auto Scaling Group"
}

variable "min_size" {
  type        = number
  description = "Minimum size of the Auto Scaling Group"
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of EC2 instances in the group"
}

variable "capacity_rebalance" {
  type        = bool
  description = "Whether capacity rebalance is enabled"
}

variable "default_cooldown" {
  type        = number
  description = "Amount of time in seconds after a scaling activity completes before another can start"
}

variable "health_check_grace_period" {
  type        = number
  description = "Time in seconds after instance comes into service before checking health"
}

variable "health_check_type" {
  type        = string
  description = "EC2 or ELB health check type"
}

variable "protect_from_scale_in" {
  type        = bool
  description = "Whether newly launched instances are automatically protected from termination on scale in"
}

variable "service_linked_role_arn" {
  type        = string
  description = "ARN of the service-linked role that the ASG will use to call other AWS services"
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "List of subnet IDs to launch resources in"
}

variable "termination_policies" {
  type        = list(string)
  description = "List of policies to decide how instances in the ASG should be terminated"
}

variable "enabled_metrics" {
  type        = list(string)
  description = "List of metrics to collect for the Auto Scaling Group"
}

variable "launch_template_id" {
  type        = string
  description = "ID of the launch template for the mixed instances policy"
}

variable "launch_template_name" {
  type        = string
  description = "Name of the launch template for the mixed instances policy"
}

variable "launch_template_version" {
  type        = string
  description = "Version of the launch template"
}

variable "override_instance_type" {
  type        = string
  description = "Instance type override in the mixed instances policy"
}

variable "tag_eks_cluster_name" {
  type        = string
  description = "Value for the eks:cluster-name tag"
}

variable "tag_cluster_autoscaler_owned" {
  type        = string
  description = "Value for the k8s.io/cluster-autoscaler/eks-ms tag"
}

variable "tag_kubernetes_cluster_owned" {
  type        = string
  description = "Value for the kubernetes.io/cluster/eks-ms tag"
}

variable "tag_eks_nodegroup_name" {
  type        = string
  description = "Value for the eks:nodegroup-name tag"
}

variable "tag_cluster_autoscaler_enabled" {
  type        = string
  description = "Value for the k8s.io/cluster-autoscaler/enabled tag"
}