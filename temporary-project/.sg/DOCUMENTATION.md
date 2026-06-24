# Multi-Resource Infrastructure Stack

## Description

Multi-region infrastructure including Athena workgroups, EKS-managed autoscaling group, CloudFormation stacks, EC2 instances, EIPs, internet gateways, IAM instance profiles, IAM roles, key pairs, and network interfaces across eu-central-1 and us-east-1.

## Module Overview

| Module | Description | Type |
|--------|-------------|------|
| `athena_workgroup` | Manages AWS Athena workgroups | Local (for_each) |
| `autoscaling_group` | Manages the EKS-managed node autoscaling group | Local (single) |
| `cloudformation_stack` | Manages AWS CloudFormation stacks | Local (for_each) |
| `eip` | Manages Elastic IP addresses | Local (single) |
| `instance` | Manages EC2 instances | Local (for_each) |
| `internet_gateway` | Manages AWS Internet Gateways | Local (for_each) |
| `iam_instance_profile` | Manages IAM instance profiles | Local (for_each) |
| `iam_role` | Manages IAM roles | Local (single) |
| `key_pair` | Manages EC2 key pairs | Local (single) |
| `network_interface` | Manages AWS network interfaces (ENIs) | Local (for_each) |

## Variables Reference

| Variable | Type | Description |
|----------|------|-------------|
| `region` | `string` | AWS region |
| `athena_workgroups` | `map(object)` | Map of Athena workgroup configurations |
| `autoscaling_group_name` | `string` | Name of the autoscaling group |
| `autoscaling_group_max_size` | `number` | Maximum size of the autoscaling group |
| `autoscaling_group_min_size` | `number` | Minimum size of the autoscaling group |
| `autoscaling_group_desired_capacity` | `number` | Desired capacity of the autoscaling group |
| `autoscaling_group_capacity_rebalance` | `bool` | Whether capacity rebalance is enabled |
| `autoscaling_group_default_cooldown` | `number` | Default cooldown period in seconds |
| `autoscaling_group_health_check_grace_period` | `number` | Health check grace period in seconds |
| `autoscaling_group_health_check_type` | `string` | Health check type |
| `autoscaling_group_vpc_zone_identifier` | `list(string)` | List of subnet IDs |
| `autoscaling_group_termination_policies` | `list(string)` | List of termination policies |
| `autoscaling_group_new_instances_protected_from_scale_in` | `bool` | Whether new instances are protected from scale in |
| `autoscaling_group_service_linked_role_arn` | `string` | ARN of the service-linked role |
| `autoscaling_group_enabled_metrics` | `list(string)` | List of metrics to collect |
| `autoscaling_group_launch_template_id` | `string` | ID of the launch template |
| `autoscaling_group_launch_template_name` | `string` | Name of the launch template |
| `autoscaling_group_launch_template_version` | `string` | Version of the launch template |
| `cloudformation_stacks` | `map(object)` | Map of CloudFormation stack configurations |
| `eip_domain` | `string` | Whether the EIP is for use in VPC |
| `eip_network_interface_id` | `string` | Network interface ID to associate with |
| `eip_network_border_group` | `string` | Location from which the IP address is advertised |
| `eip_public_ipv4_pool` | `string` | EC2 IPv4 address pool identifier |
| `eip_tags` | `map(string)` | Tags to assign to the EIP |
| `instances` | `map(object)` | Map of EC2 instance configurations |
| `internet_gateways` | `map(object)` | Map of internet gateway configurations |
| `iam_instance_profiles` | `map(object)` | Map of IAM instance profile configurations |
| `iam_role_autoscaling_name` | `string` | Name of the autoscaling IAM role |
| `iam_role_autoscaling_path` | `string` | Path to the autoscaling IAM role |
| `iam_role_autoscaling_description` | `string` | Description of the autoscaling IAM role |
| `iam_role_autoscaling_assume_role_policy` | `string` | JSON assume role policy |
| `iam_role_autoscaling_max_session_duration` | `number` | Maximum session duration in seconds |
| `key_pair_key_name` | `string` | Name of the key pair |
| `key_pair_public_key` | `string` | Public key material (sensitive) |
| `network_interfaces` | `map(object)` | Map of network interface configurations |

## Outputs Reference

| Output | Description |
|--------|-------------|
| `athena_workgroup_arns` | ARNs of all Athena workgroups |
| `autoscaling_group_id` | ID of the autoscaling group |
| `autoscaling_group_arn` | ARN of the autoscaling group |
| `eip_public_ip` | Public IP of the EIP |
| `eip_allocation_id` | Allocation ID of the EIP |
| `key_pair_id` | ID of the key pair |

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