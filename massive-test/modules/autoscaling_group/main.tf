resource "aws_autoscaling_group" "this" {
  name                                = var.name
  max_size                            = var.max_size
  min_size                            = var.min_size
  desired_capacity                    = var.desired_capacity
  vpc_zone_identifier                 = var.vpc_zone_identifier
  capacity_rebalance                  = var.capacity_rebalance
  default_cooldown                    = var.default_cooldown
  health_check_grace_period           = var.health_check_grace_period
  health_check_type                   = var.health_check_type
  protect_from_scale_in               = var.new_instances_protected_from_scale_in
  service_linked_role_arn             = var.service_linked_role_arn
  termination_policies                = var.termination_policies
  enabled_metrics                     = var.enabled_metrics

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = var.mixed_instances_policy_launch_template_id
        version            = var.mixed_instances_policy_launch_template_version
      }

      override {
        instance_type = var.mixed_instances_policy_override_instance_type
      }
    }
  }

  tag {
    key                 = "eks:cluster-name"
    value               = var.tag_eks_cluster_name
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-ms"
    value               = var.tag_k8s_autoscaler_eks_ms
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-ms"
    value               = var.tag_kubernetes_cluster_eks_ms
    propagate_at_launch = true
  }

  tag {
    key                 = "eks:nodegroup-name"
    value               = var.tag_eks_nodegroup_name
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    value               = var.tag_k8s_autoscaler_enabled
    propagate_at_launch = true
  }
}