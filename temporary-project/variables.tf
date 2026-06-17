variable "region" {
  type        = string
  description = "AWS region"
}

variable "athena_workgroups" {
  type = map(object({
    name                               = string
    state                              = string
    enforce_workgroup_configuration    = bool
    publish_cloudwatch_metrics_enabled = bool
    requester_pays_enabled             = bool
    selected_engine_version            = string
  }))
  description = "Map of Athena workgroup configurations"
  default     = {}
}

variable "autoscaling_group_name" {
  type        = string
  description = "Name of the autoscaling group"
}

variable "autoscaling_group_max_size" {
  type        = number
  description = "Maximum size of the autoscaling group"
}

variable "autoscaling_group_min_size" {
  type        = number
  description = "Minimum size of the autoscaling group"
}

variable "autoscaling_group_desired_capacity" {
  type        = number
  description = "Desired capacity of the autoscaling group"
}

variable "autoscaling_group_capacity_rebalance" {
  type        = bool
  description = "Whether capacity rebalance is enabled"
}

variable "autoscaling_group_default_cooldown" {
  type        = number
  description = "Default cooldown period in seconds"
}

variable "autoscaling_group_health_check_grace_period" {
  type        = number
  description = "Health check grace period in seconds"
}

variable "autoscaling_group_health_check_type" {
  type        = string
  description = "Health check type (EC2 or ELB)"
}

variable "autoscaling_group_vpc_zone_identifier" {
  type        = list(string)
  description = "List of subnet IDs for the autoscaling group"
}

variable "autoscaling_group_termination_policies" {
  type        = list(string)
  description = "List of termination policies"
}

variable "autoscaling_group_protect_from_scale_in" {
  type        = bool
  description = "Whether new instances are protected from scale in"
}

variable "autoscaling_group_service_linked_role_arn" {
  type        = string
  description = "ARN of the service-linked role for the ASG"
}

variable "autoscaling_group_enabled_metrics" {
  type        = list(string)
  description = "List of metrics to collect"
}

variable "autoscaling_group_launch_template_id" {
  type        = string
  description = "ID of the launch template"
}

variable "autoscaling_group_launch_template_name" {
  type        = string
  description = "Name of the launch template"
}

variable "autoscaling_group_launch_template_version" {
  type        = string
  description = "Version of the launch template"
}

variable "cloudformation_stacks" {
  type = map(object({
    name             = string
    capabilities     = list(string)
    disable_rollback = bool
    parameters       = map(string)
  }))
  description = "Map of CloudFormation stack configurations"
  default     = {}
}

variable "eip_domain" {
  type        = string
  description = "Whether the EIP is for use in VPC"
}

variable "eip_network_interface_id" {
  type        = string
  description = "Network interface ID to associate with"
}

variable "eip_network_border_group" {
  type        = string
  description = "Location from which the IP address is advertised"
}

variable "eip_public_ipv4_pool" {
  type        = string
  description = "EC2 IPv4 address pool identifier"
}

variable "eip_tags" {
  type        = map(string)
  description = "Tags to assign to the EIP"
}

variable "instances" {
  type = map(object({
    ami_id                               = string
    instance_type                        = string
    availability_zone                    = string
    subnet_id                            = string
    vpc_security_group_ids               = list(string)
    iam_instance_profile                 = string
    key_name                             = string
    source_dest_check                    = bool
    tenancy                              = string
    ebs_optimized                        = bool
    monitoring                           = bool
    metadata_http_endpoint               = string
    metadata_http_protocol_ipv6          = string
    metadata_http_put_response_hop_limit = number
    metadata_http_tokens                 = string
    metadata_instance_metadata_tags      = string
    tags                                 = map(string)
  }))
  description = "Map of EC2 instance configurations"
  default     = {}
}

variable "internet_gateways" {
  type = map(object({
    vpc_id = string
    tags   = map(string)
  }))
  description = "Map of internet gateway configurations"
  default     = {}
}

variable "iam_instance_profiles" {
  type = map(object({
    name = string
    path = string
    role = string
  }))
  description = "Map of IAM instance profile configurations"
  default     = {}
}

variable "iam_role_autoscaling_name" {
  type        = string
  description = "Name of the autoscaling IAM role"
}

variable "iam_role_autoscaling_path" {
  type        = string
  description = "Path to the autoscaling IAM role"
}

variable "iam_role_autoscaling_description" {
  type        = string
  description = "Description of the autoscaling IAM role"
}

variable "iam_role_autoscaling_assume_role_policy" {
  type        = string
  description = "JSON assume role policy for the autoscaling IAM role"
}

variable "iam_role_autoscaling_max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds for the autoscaling IAM role"
}

variable "key_pair_key_name" {
  type        = string
  description = "Name of the key pair"
}

variable "key_pair_public_key" {
  type        = string
  description = "Public key material"
}

variable "network_interfaces" {
  type = map(object({
    subnet_id         = string
    description       = string
    source_dest_check = bool
    security_groups   = list(string)
    tags              = map(string)
  }))
  description = "Map of network interface configurations"
  default     = {}
}