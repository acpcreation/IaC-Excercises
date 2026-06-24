# multi-region-infrastructure

## Description

Multi-region infrastructure including Athena workgroups, CloudFormation stacks, EC2 instances, EIP, internet gateways, key pairs, launch templates, NAT gateway, network ACLs, and autoscaling group.

## Module Overview

| Module | Description | Resource Type |
|--------|-------------|---------------|
| athena_workgroup | Manages AWS Athena workgroups | aws_athena_workgroup |
| cloudformation_stack | Manages AWS CloudFormation stacks | aws_cloudformation_stack |
| instance | Manages AWS EC2 instances | aws_instance |
| eip | Manages AWS Elastic IP addresses | aws_eip |
| internet_gateway | Manages AWS Internet Gateways | aws_internet_gateway |
| key_pair | Manages AWS Key Pairs | aws_key_pair |
| launch_template | Manages AWS Launch Templates | aws_launch_template |
| nat_gateway | Manages the basic-eks NAT Gateway | aws_nat_gateway |
| network_acl | Manages AWS Network ACLs | aws_network_acl |
| autoscaling_group | Manages the EKS managed node autoscaling group | aws_autoscaling_group |

## Variables Reference

| Variable | Type | Description |
|----------|------|-------------|
| region | string | AWS region |
| athena_workgroups | map(object) | Map of Athena workgroup configurations |
| cloudformation_stacks | map(object) | Map of CloudFormation stack configurations |
| instances | map(object) | Map of EC2 instance configurations |
| eip_domain | string | Indicates if this EIP is for use in VPC |
| eip_network_border_group | string | Location from which the IP address is advertised |
| eip_public_ipv4_pool | string | EC2 IPv4 address pool identifier |
| eip_tags | map(string) | Tags to assign to the EIP |
| internet_gateways | map(object) | Map of internet gateway configurations |
| key_pairs | map(object) | Map of key pair configurations |
| launch_templates | map(object) | Map of launch template configurations |
| nat_gateway_allocation_id | string | Allocation ID of the EIP for the NAT gateway |
| nat_gateway_subnet_id | string | Subnet ID for the NAT gateway |
| nat_gateway_tags | map(string) | Tags to assign to the NAT gateway |
| network_acls | map(object) | Map of network ACL configurations |
| asg_name | string | Name of the Auto Scaling Group |
| asg_max_size | number | Maximum size of the Auto Scaling Group |
| asg_min_size | number | Minimum size of the Auto Scaling Group |
| asg_desired_capacity | number | Desired capacity of the Auto Scaling Group |
| asg_vpc_zone_identifier | list(string) | List of subnet IDs for the Auto Scaling Group |
| asg_capacity_rebalance | bool | Whether capacity rebalance is enabled |
| asg_default_cooldown | number | Default cooldown period in seconds |
| asg_health_check_grace_period | number | Health check grace period in seconds |
| asg_health_check_type | string | Health check type (EC2 or ELB) |
| asg_new_instances_protected_from_scale_in | bool | Whether new instances are protected from scale in |
| asg_service_linked_role_arn | string | ARN of the service-linked role for the ASG |
| asg_termination_policies | list(string) | List of termination policies |
| asg_enabled_metrics | list(string) | List of metrics to collect |
| asg_mixed_instances_policy_launch_template_id | string | ID of the launch template for mixed instances policy |
| asg_mixed_instances_policy_launch_template_version | string | Version of the launch template for mixed instances policy |
| asg_mixed_instances_policy_override_instance_type | string | Instance type override in mixed instances policy |
| asg_tag_eks_cluster_name | string | Value for eks:cluster-name tag |
| asg_tag_k8s_autoscaler_eks_ms | string | Value for k8s.io/cluster-autoscaler/eks-ms tag |
| asg_tag_kubernetes_cluster_eks_ms | string | Value for kubernetes.io/cluster/eks-ms tag |
| asg_tag_eks_nodegroup_name | string | Value for eks:nodegroup-name tag |
| asg_tag_k8s_autoscaler_enabled | string | Value for k8s.io/cluster-autoscaler/enabled tag |

## Outputs Reference

| Output | Description |
|--------|-------------|
| nat_gateway_id | NAT gateway ID |
| eip_public_ip | Public IP address of the EIP |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import existing resources

```sh
chmod +x imports.sh
./imports.sh terraform
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```