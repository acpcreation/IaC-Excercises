resource "aws_autoscaling_group" "this" {
  name                      = var.name
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  capacity_rebalance        = var.capacity_rebalance
  default_cooldown          = var.default_cooldown
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  vpc_zone_identifier       = var.vpc_zone_identifier
  termination_policies      = var.termination_policies
  protect_from_scale_in     = var.protect_from_scale_in
  service_linked_role_arn   = var.service_linked_role_arn
  enabled_metrics           = var.enabled_metrics

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id   = var.launch_template_id
        launch_template_name = var.launch_template_name
        version              = var.launch_template_version
      }

      override {
        instance_type = "t3.medium"
      }
    }
  }

  tag {
    key                 = "eks:cluster-name"
    value               = "eks-ms"
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/eks-ms"
    value               = "owned"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-ms"
    value               = "owned"
    propagate_at_launch = true
  }

  tag {
    key                 = "eks:nodegroup-name"
    value               = "managed-node-20260305134536297600000007"
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    value               = "true"
    propagate_at_launch = true
  }
}