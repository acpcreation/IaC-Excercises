module "athena_workgroup" {
  source   = "./modules/athena_workgroup"
  for_each = var.athena_workgroups

  athena_workgroups = var.athena_workgroups
}

module "cloudformation_stack" {
  source   = "./modules/cloudformation_stack"
  for_each = var.cloudformation_stacks

  cloudformation_stacks = var.cloudformation_stacks
}

module "instance" {
  source   = "./modules/instance"
  for_each = var.instances

  instances = var.instances
}

module "eip" {
  source = "./modules/eip"

  domain               = var.eip_domain
  network_border_group = var.eip_network_border_group
  public_ipv4_pool     = var.eip_public_ipv4_pool
  tags                 = var.eip_tags
}

module "internet_gateway" {
  source   = "./modules/internet_gateway"
  for_each = var.internet_gateways

  internet_gateways = var.internet_gateways
}

module "key_pair" {
  source   = "./modules/key_pair"
  for_each = var.key_pairs

  key_pairs = var.key_pairs
}

module "launch_template" {
  source   = "./modules/launch_template"
  for_each = var.launch_templates

  launch_templates = var.launch_templates
}

module "nat_gateway" {
  source = "./modules/nat_gateway"

  allocation_id = var.nat_gateway_allocation_id
  subnet_id     = var.nat_gateway_subnet_id
  tags          = var.nat_gateway_tags
}

module "network_acl" {
  source   = "./modules/network_acl"
  for_each = var.network_acls

  network_acls = var.network_acls
}

module "autoscaling_group" {
  source = "./modules/autoscaling_group"

  name                                           = var.asg_name
  max_size                                       = var.asg_max_size
  min_size                                       = var.asg_min_size
  desired_capacity                               = var.asg_desired_capacity
  vpc_zone_identifier                            = var.asg_vpc_zone_identifier
  capacity_rebalance                             = var.asg_capacity_rebalance
  default_cooldown                               = var.asg_default_cooldown
  health_check_grace_period                      = var.asg_health_check_grace_period
  health_check_type                              = var.asg_health_check_type
  new_instances_protected_from_scale_in          = var.asg_new_instances_protected_from_scale_in
  service_linked_role_arn                        = var.asg_service_linked_role_arn
  termination_policies                           = var.asg_termination_policies
  enabled_metrics                                = var.asg_enabled_metrics
  mixed_instances_policy_launch_template_id      = var.asg_mixed_instances_policy_launch_template_id
  mixed_instances_policy_launch_template_version = var.asg_mixed_instances_policy_launch_template_version
  mixed_instances_policy_override_instance_type  = var.asg_mixed_instances_policy_override_instance_type
  tag_eks_cluster_name                           = var.asg_tag_eks_cluster_name
  tag_k8s_autoscaler_eks_ms                      = var.asg_tag_k8s_autoscaler_eks_ms
  tag_kubernetes_cluster_eks_ms                  = var.asg_tag_kubernetes_cluster_eks_ms
  tag_eks_nodegroup_name                         = var.asg_tag_eks_nodegroup_name
  tag_k8s_autoscaler_enabled                     = var.asg_tag_k8s_autoscaler_enabled
}