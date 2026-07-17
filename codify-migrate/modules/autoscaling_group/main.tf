resource "aws_autoscaling_group" "this" {
  capacity_rebalance        = var.capacity_rebalance
  default_cooldown          = var.default_cooldown
  desired_capacity          = var.desired_capacity
  enabled_metrics           = var.enabled_metrics
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  max_size                  = var.max_size
  min_size                  = var.min_size
  name                      = var.name
  protect_from_scale_in     = var.protect_from_scale_in
  service_linked_role_arn   = var.service_linked_role_arn
  termination_policies      = var.termination_policies
  vpc_zone_identifier       = var.vpc_zone_identifier

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id   = var.launch_template_id
        launch_template_name = var.launch_template_name
        version              = var.launch_template_version
      }

      override {
        instance_type = var.override_instance_type
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
    value               = var.tag_cluster_autoscaler_owned
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/eks-ms"
    value               = var.tag_kubernetes_cluster_owned
    propagate_at_launch = true
  }

  tag {
    key                 = "eks:nodegroup-name"
    value               = var.tag_eks_nodegroup_name
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    value               = var.tag_cluster_autoscaler_enabled
    propagate_at_launch = true
  }
}