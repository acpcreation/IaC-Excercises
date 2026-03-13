# Bastion SSH CIDR Block Management

This simplified Terraform project manages SSH CIDR blocks for the bastion server security group. It allows you to add, remove, or modify IP addresses and CIDR blocks that are allowed to SSH to the bastion server.

## Features

- **Dynamic CIDR Management**: Add/remove SSH access for specific IP addresses or CIDR blocks
- **Descriptive Labels**: Each CIDR block can have a description for easy identification  
- **Simple Configuration**: Just requires the security group ID and CIDR blocks
- **Individual Rules**: Creates separate security group rules for each CIDR block for better granularity

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate permissions
- Existing bastion server infrastructure (created by the `create-server` project)
- Bastion security group ID (get from `create-server` outputs)

## Quick Start

1. **Get the security group ID** from the create-server project:
   ```bash
   cd ../create-server
   terraform output bastion_security_group_id
   ```

2. **Copy the example configuration**:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

3. **Edit the configuration** with your security group ID and CIDR blocks:
   ```bash
   vim terraform.tfvars
   ```

4. **Initialize and apply**:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Configuration Examples

### Basic Configuration

```hcl
bastion_security_group_id = "sg-0abc123def456789"

ssh_cidr_blocks = {
  "admin_home" = {
    cidr_block  = "203.0.113.45/32"
    description = "Admin home IP"
  }
}
```

### Adding Multiple IPs

```hcl
ssh_cidr_blocks = {
  "admin_home" = {
    cidr_block  = "203.0.113.45/32"
    description = "Admin home IP"  
  }
  
  "office_network" = {
    cidr_block  = "192.168.1.0/24"
    description = "Office network subnet"
  }
  
  "contractor" = {
    cidr_block  = "198.51.100.123/32"
    description = "Contractor workstation"
  }
}
```

### Removing Access

Simply remove the entry from `ssh_cidr_blocks` and run `terraform apply`.

## Variables Reference

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `aws_region` | AWS region | `us-east-1` | No |
| `bastion_security_group_id` | Security group ID | `"sg-0dadb1f321182cf6f"` | Yes |
| `ssh_cidr_blocks` | Map of CIDR blocks to allow | See example | No |
| `common_ssh_port` | SSH port | `22` | No |

## Outputs

- `bastion_security_group_id`: ID of the managed security group
- `managed_ssh_rules`: Current SSH CIDR blocks being managed
- `ssh_port`: Configured SSH port
- `security_group_arn`: ARN of the security group

## Security Best Practices

1. **Use specific IPs**: Prefer `/32` CIDR blocks for individual IP addresses
2. **Regular reviews**: Periodically review and remove unused CIDR blocks
3. **Descriptive names**: Use clear, descriptive names for each CIDR block
4. **Principle of least privilege**: Only add CIDR blocks that actually need SSH access

## Troubleshooting

### Security Group Not Found
Ensure you have the correct `bastion_security_group_id` from the create-server project outputs.

### Permission Denied
Ensure your AWS credentials have the following permissions:
- `ec2:DescribeSecurityGroups`
- `ec2:AuthorizeSecurityGroupIngress`
- `ec2:RevokeSecurityGroupIngress`