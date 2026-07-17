variable "name" {
  type        = string
  description = "Name of the autoscaling group"
}

variable "max_size" {
  type        = number
  description = "Maximum size of the autoscaling group"
}

variable "min_size" {
  type        = number
  description = "Minimum size of the autoscaling group"
}

variable "desired_capacity" {
  type        = number
  description = "Desired capacity of the autoscaling group"
}

variable "capacity_rebalance" {
  type        = bool
  description = "Whether capacity rebalance is enabled"
}

variable "default_cooldown" {
  type        = number
  description = "Default cooldown period in seconds"
}

variable "health_check_grace_period" {
  type        = number
  description = "Health check grace period in seconds"
}

variable "health_check_type" {
  type        = string
  description = "Health check type (EC2 or ELB)"
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "List of subnet IDs for the autoscaling group"
}

variable "termination_policies" {
  type        = list(string)
  description = "List of termination policies"
}

variable "protect_from_scale_in" {
  type        = bool
  description = "Whether new instances are protected from scale in"
}

variable "service_linked_role_arn" {
  type        = string
  description = "ARN of the service-linked role for the ASG"
}

variable "enabled_metrics" {
  type        = list(string)
  description = "List of metrics to collect"
}

variable "launch_template_id" {
  type        = string
  description = "ID of the launch template"
}

variable "launch_template_name" {
  type        = string
  description = "Name of the launch template"
}

variable "launch_template_version" {
  type        = string
  description = "Version of the launch template"
}