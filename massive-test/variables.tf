variable "region" {
  description = "AWS region"
  type        = string
}

variable "athena_workgroups" {
  description = "Map of Athena workgroup configurations"
  type = map(object({
    name                               = string
    state                              = string
    enforce_workgroup_configuration    = bool
    publish_cloudwatch_metrics_enabled = bool
    requester_pays_enabled             = bool
    selected_engine_version            = string
  }))
  default = {}
}

variable "cloudformation_stacks" {
  description = "Map of CloudFormation stack configurations"
  type = map(object({
    name             = string
    capabilities     = list(string)
    disable_rollback = bool
    parameters       = map(string)
  }))
  default = {}
}

variable "instances" {
  description = "Map of EC2 instance configurations"
  type = map(object({
    ami                    = string
    instance_type          = string
    availability_zone      = string
    key_name               = string
    subnet_id              = string
    vpc_security_group_ids = list(string)
    iam_instance_profile   = string
    source_dest_check      = bool
    tenancy                = string
    monitoring             = bool
    tags                   = map(string)
  }))
  default = {}
}

variable "eip_domain" {
  description = "Indicates if this EIP is for use in VPC"
  type        = string
}

variable "eip_network_border_group" {
  description = "Location from which the IP address is advertised"
  type        = string
}

variable "eip_public_ipv4_pool" {
  description = "EC2 IPv4 address pool identifier"
  type        = string
}

variable "eip_tags" {
  description = "Tags to assign to the EIP"
  type        = map(string)
}

variable "internet_gateways" {
  description = "Map of internet gateway configurations"
  type = map(object({
    vpc_id = string
    tags   = map(string)
  }))
  default = {}
}

variable "key_pairs" {
  description = "Map of key pair configurations"
  type = map(object({
    key_name   = string
    public_key = string
  }))
  default = {}
}

variable "launch_templates" {
  description = "Map of launch template configurations"
  type = map(object({
    name = string
    tags = map(string)
  }))
  default = {}
}

variable "nat_gateway_allocation_id" {
  description = "Allocation ID of the EIP for the NAT gateway"
  type        = string
}

variable "nat_gateway_subnet_id" {
  description = "Subnet ID for the NAT gateway"
  type        = string
}

variable "nat_gateway_tags" {
  description = "Tags to assign to the NAT gateway"
  type        = map(string)
}

variable "network_acls" {
  description = "Map of network ACL configurations"
  type = map(object({
    vpc_id     = string
    subnet_ids = list(string)
    ingress = list(object({
      rule_no    = number
      action     = string
      protocol   = string
      cidr_block = string
      from_port  = number
      to_port    = number
    }))
    egress = list(object({
      rule_no    = number
      action     = string
      protocol   = string
      cidr_block = string
      from_port  = number
      to_port    = number
    }))
  }))
  default = {}
}

variable "asg_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "asg_max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}

variable "asg_min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  type        = number
}

variable "asg_vpc_zone_identifier" {
  description = "List of subnet IDs for the Auto Scaling Group"
  type        = list(string)
}

variable "asg_capacity_rebalance" {
  description = "Whether capacity rebalance is enabled"
  type        = bool
}

variable "asg_default_cooldown" {
  description = "Default cooldown period in seconds"
  type        = number
}

variable "asg_health_check_grace_period" {
  description = "Health check grace period in seconds"
  type        = number
}

variable "asg_health_check_type" {
  description = "Health check type (EC2 or ELB)"
  type        = string
}

variable "asg_new_instances_protected_from_scale_in" {
  description = "Whether new instances are protected from scale in"
  type        = bool
}

variable "asg_service_linked_role_arn" {
  description = "ARN of the service-linked role for the ASG"
  type        = string
}

variable "asg_termination_policies" {
  description = "List of termination policies"
  type        = list(string)
}

variable "asg_enabled_metrics" {
  description = "List of metrics to collect"
  type        = list(string)
}

variable "asg_mixed_instances_policy_launch_template_id" {
  description = "ID of the launch template for mixed instances policy"
  type        = string
}

variable "asg_mixed_instances_policy_launch_template_version" {
  description = "Version of the launch template for mixed instances policy"
  type        = string
}

variable "asg_mixed_instances_policy_override_instance_type" {
  description = "Instance type override in mixed instances policy"
  type        = string
}

variable "asg_tag_eks_cluster_name" {
  description = "Value for eks:cluster-name tag"
  type        = string
}

variable "asg_tag_k8s_autoscaler_eks_ms" {
  description = "Value for k8s.io/cluster-autoscaler/eks-ms tag"
  type        = string
}

variable "asg_tag_kubernetes_cluster_eks_ms" {
  description = "Value for kubernetes.io/cluster/eks-ms tag"
  type        = string
}

variable "asg_tag_eks_nodegroup_name" {
  description = "Value for eks:nodegroup-name tag"
  type        = string
}

variable "asg_tag_k8s_autoscaler_enabled" {
  description = "Value for k8s.io/cluster-autoscaler/enabled tag"
  type        = string
}