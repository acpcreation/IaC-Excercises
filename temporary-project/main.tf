module "athena_workgroup" {
  source   = "./modules/athena_workgroup"
  for_each = var.athena_workgroups

  name                               = each.value.name
  state                              = each.value.state
  enforce_workgroup_configuration    = each.value.enforce_workgroup_configuration
  publish_cloudwatch_metrics_enabled = each.value.publish_cloudwatch_metrics_enabled
  requester_pays_enabled             = each.value.requester_pays_enabled
  selected_engine_version            = each.value.selected_engine_version
}

module "autoscaling_group" {
  source = "./modules/autoscaling_group"

  name                    = var.autoscaling_group_name
  max_size                = var.autoscaling_group_max_size
  min_size                = var.autoscaling_group_min_size
  desired_capacity        = var.autoscaling_group_desired_capacity
  capacity_rebalance      = var.autoscaling_group_capacity_rebalance
  default_cooldown        = var.autoscaling_group_default_cooldown
  health_check_grace_period = var.autoscaling_group_health_check_grace_period
  health_check_type       = var.autoscaling_group_health_check_type
  vpc_zone_identifier     = var.autoscaling_group_vpc_zone_identifier
  termination_policies    = var.autoscaling_group_termination_policies
  protect_from_scale_in   = var.autoscaling_group_protect_from_scale_in
  service_linked_role_arn = var.autoscaling_group_service_linked_role_arn
  enabled_metrics         = var.autoscaling_group_enabled_metrics
  launch_template_id      = var.autoscaling_group_launch_template_id
  launch_template_name    = var.autoscaling_group_launch_template_name
  launch_template_version = var.autoscaling_group_launch_template_version
}

module "cloudformation_stack" {
  source   = "./modules/cloudformation_stack"
  for_each = var.cloudformation_stacks

  name             = each.value.name
  capabilities     = each.value.capabilities
  disable_rollback = each.value.disable_rollback
  parameters       = each.value.parameters
}

module "eip_basic_eks_eu_central_1a" {
  source = "./modules/eip"

  domain               = var.eip_domain
  network_interface_id = var.eip_network_interface_id
  network_border_group = var.eip_network_border_group
  public_ipv4_pool     = var.eip_public_ipv4_pool
  tags                 = var.eip_tags
}

module "instance" {
  source   = "./modules/instance"
  for_each = var.instances

  ami_id                               = each.value.ami_id
  instance_type                        = each.value.instance_type
  availability_zone                    = each.value.availability_zone
  subnet_id                            = each.value.subnet_id
  vpc_security_group_ids               = each.value.vpc_security_group_ids
  iam_instance_profile                 = each.value.iam_instance_profile
  key_name                             = each.value.key_name
  source_dest_check                    = each.value.source_dest_check
  tenancy                              = each.value.tenancy
  ebs_optimized                        = each.value.ebs_optimized
  monitoring                           = each.value.monitoring
  metadata_http_endpoint               = each.value.metadata_http_endpoint
  metadata_http_protocol_ipv6          = each.value.metadata_http_protocol_ipv6
  metadata_http_put_response_hop_limit = each.value.metadata_http_put_response_hop_limit
  metadata_http_tokens                 = each.value.metadata_http_tokens
  metadata_instance_metadata_tags      = each.value.metadata_instance_metadata_tags
  tags                                 = each.value.tags
}

module "internet_gateway" {
  source   = "./modules/internet_gateway"
  for_each = var.internet_gateways

  vpc_id = each.value.vpc_id
  tags   = each.value.tags
}

module "iam_instance_profile" {
  source   = "./modules/iam_instance_profile"
  for_each = var.iam_instance_profiles

  name = each.value.name
  path = each.value.path
  role = each.value.role
}

module "iam_role_autoscaling" {
  source = "./modules/iam_role"

  name                 = var.iam_role_autoscaling_name
  path                 = var.iam_role_autoscaling_path
  description          = var.iam_role_autoscaling_description
  assume_role_policy   = var.iam_role_autoscaling_assume_role_policy
  max_session_duration = var.iam_role_autoscaling_max_session_duration
}

module "key_pair_private_runner_workshop" {
  source = "./modules/key_pair"

  key_name   = var.key_pair_key_name
  public_key = var.key_pair_public_key
}

module "network_interface" {
  source   = "./modules/network_interface"
  for_each = var.network_interfaces

  subnet_id         = each.value.subnet_id
  description       = each.value.description
  source_dest_check = each.value.source_dest_check
  security_groups   = each.value.security_groups
  tags              = each.value.tags
}