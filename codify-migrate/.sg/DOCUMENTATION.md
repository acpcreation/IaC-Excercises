# eks-managed-node-autoscaling

## Description

EKS managed node group Auto Scaling Group with associated IAM service-linked role.

This stack provisions:
- An IAM service-linked role for Auto Scaling (`AWSServiceRoleForAutoScaling`)
- An EKS managed node group Auto Scaling Group using a mixed instances policy with a launch template override

## Module Overview

| Module | Description |
|--------|-------------|
| `iam_role` | IAM service-linked role for Auto Scaling |
| `autoscaling_group` | EKS managed node group Auto Scaling Group using mixed instances policy |

## Variables Reference

| Variable | Type | Description |
|----------|------|-------------|
| `region` | string | AWS region |
| `iam_role_name` | string | Friendly name of the IAM role |
| `iam_role_path` | string | Path to the role |
| `iam_role_description` | string | Description of the role |
| `iam_role_max_session_duration` | number | Maximum session duration in seconds |
| `iam_role_assume_role_policy` | string | Policy that grants an entity permission to assume the role |
| `asg_name` | string | Name of the Auto Scaling Group |
| `asg_max_size` | number | Maximum size of the Auto Scaling Group |
| `asg_min_size` | number | Minimum size of the Auto Scaling Group |
| `asg_desired_capacity` | number | Desired number of EC2 instances in the group |
| `asg_capacity_rebalance` | bool | Whether capacity rebalance is enabled |
| `asg_default_cooldown` | number | Amount of time in seconds after a scaling activity completes before another can start |
| `asg_health_check_grace_period` | number | Time in seconds after instance comes into service before checking health |
| `asg_health_check_type` | string | EC2 or ELB health check type |
| `asg_protect_from_scale_in` | bool | Whether newly launched instances are automatically protected from termination on scale in |
| `asg_vpc_zone_identifier` | list(string) | List of subnet IDs to launch resources in |
| `asg_termination_policies` | list(string) | List of policies to decide how instances in the ASG should be terminated |
| `asg_enabled_metrics` | list(string) | List of metrics to collect for the Auto Scaling Group |
| `asg_launch_template_id` | string | ID of the launch template for the mixed instances policy |
| `asg_launch_template_name` | string | Name of the launch template for the mixed instances policy |
| `asg_launch_template_version` | string | Version of the launch template |
| `asg_override_instance_type` | string | Instance type override in the mixed instances policy |
| `asg_tag_eks_cluster_name` | string | Value for the eks:cluster-name tag |
| `asg_tag_cluster_autoscaler_owned` | string | Value for the k8s.io/cluster-autoscaler/eks-ms tag |
| `asg_tag_kubernetes_cluster_owned` | string | Value for the kubernetes.io/cluster/eks-ms tag |
| `asg_tag_eks_nodegroup_name` | string | Value for the eks:nodegroup-name tag |
| `asg_tag_cluster_autoscaler_enabled` | string | Value for the k8s.io/cluster-autoscaler/enabled tag |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `iam_role_arn` | ARN of the IAM role |
| `iam_role_name` | Name of the IAM role |
| `autoscaling_group_id` | ID of the Auto Scaling Group |
| `autoscaling_group_arn` | ARN of the Auto Scaling Group |
| `autoscaling_group_name` | Name of the Auto Scaling Group |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
./imports.sh terraform
# or with OpenTofu:
./imports.sh tofu
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```