region = "eu-central-1"

iam_role_name                = "AWSServiceRoleForAutoScaling"
iam_role_path                = "/aws-service-role/autoscaling.amazonaws.com/"
iam_role_description         = "Default Service-Linked Role enables access to AWS Services and Resources used or managed by Auto Scaling"
iam_role_max_session_duration = 3600
iam_role_assume_role_policy  = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "autoscaling.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOT

asg_name                    = "eks-managed-node-20260305134536297600000007-fece5f1f-94cc-37f3-cca2-2de45fbc88e4"
asg_max_size                = 3
asg_min_size                = 0
asg_desired_capacity        = 1
asg_capacity_rebalance      = true
asg_default_cooldown        = 300
asg_health_check_grace_period = 15
asg_health_check_type       = "EC2"
asg_protect_from_scale_in   = false

asg_vpc_zone_identifier = [
  "subnet-028eab44c9937988a",
  "subnet-083c90a8048614a76",
]

asg_termination_policies = [
  "AllocationStrategy",
  "OldestLaunchTemplate",
  "OldestInstance",
]

asg_enabled_metrics = [
  "WarmPoolDesiredCapacity",
  "GroupPendingInstances",
  "WarmPoolPendingCapacity",
  "GroupStandbyCapacity",
  "GroupTotalCapacity",
  "GroupTerminatingRetainedCapacity",
  "WarmPoolTotalCapacity",
  "GroupInServiceInstances",
  "GroupInServiceCapacity",
  "WarmPoolWarmedCapacity",
  "GroupTerminatingRetainedInstances",
  "GroupTerminatingCapacity",
  "GroupMaxSize",
  "GroupAndWarmPoolTotalCapacity",
  "GroupTotalInstances",
  "WarmPoolTerminatingRetainedCapacity",
  "GroupMinSize",
  "GroupStandbyInstances",
  "GroupDesiredCapacity",
  "WarmPoolMinSize",
  "GroupAndWarmPoolDesiredCapacity",
  "GroupTerminatingInstances",
  "WarmPoolTerminatingCapacity",
  "WarmPoolPendingRetainedCapacity",
  "GroupPendingCapacity",
]

asg_launch_template_id      = "lt-0f9cc5046868cfc14"
asg_launch_template_name    = "eks-fece5f1f-94cc-37f3-cca2-2de45fbc88e4"
asg_launch_template_version = "1"
asg_override_instance_type  = "t3.medium"

asg_tag_eks_cluster_name           = "eks-ms"
asg_tag_cluster_autoscaler_owned   = "owned"
asg_tag_kubernetes_cluster_owned   = "owned"
asg_tag_eks_nodegroup_name         = "managed-node-20260305134536297600000007"
asg_tag_cluster_autoscaler_enabled = "true"