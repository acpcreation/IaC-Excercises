# Simple VPC Terraform Project

A straightforward Terraform project to create a Virtual Private Cloud (VPC) on AWS with public and private subnets.

## Project Structure

```
terraform-vpc/
├── provider.tf       # AWS provider configuration
├── variables.tf      # Input variables
├── main.tf          # VPC and network resources
├── outputs.tf       # Output values
└── README.md        # This file
```

## Resources Created

- **VPC** - Virtual Private Cloud with configurable CIDR block
- **Internet Gateway** - For public subnet internet access
- **Public Subnets** - 2 subnets by default (configurable)
- **Private Subnets** - 2 subnets by default (configurable)
- **NAT Gateway** - Optional, for private subnet outbound access
- **Route Tables** - Separate routing for public and private subnets
- **Route Associations** - Links subnets to their respective route tables

## Prerequisites

- AWS Account with appropriate credentials configured
- Terraform >= 1.0
- AWS CLI (optional, for verification)

## Quick Start

### 1. Initialize Terraform

```bash
cd terraform-vpc
terraform init
```

### 2. Review Configuration

```bash
terraform plan
```

### 3. Deploy VPC

```bash
terraform apply
```

### 4. View Outputs

```bash
terraform output
```

## Configuration

### Basic VPC with Default Settings

```bash
terraform apply
```

Creates:
- VPC: `10.0.0.0/16`
- 2 Public subnets: `10.0.1.0/24`, `10.0.2.0/24`
- 2 Private subnets: `10.0.10.0/24`, `10.0.11.0/24`
- Internet Gateway for public access
- No NAT Gateway (private subnets have no internet access)

### Customize with Variables

Create a `terraform.tfvars` file:

```hcl
vpc_cidr = "10.1.0.0/16"
vpc_name = "my-custom-vpc"

public_subnet_cidrs = [
  "10.1.1.0/24",
  "10.1.2.0/24",
  "10.1.3.0/24"
]

private_subnet_cidrs = [
  "10.1.100.0/24",
  "10.1.101.0/24"
]

enable_nat_gateway = true
```

Then apply:

```bash
terraform apply
```

### Enable NAT Gateway

To allow private subnets to access the internet (outbound):

```bash
terraform apply -var="enable_nat_gateway=true"
```

This creates an Elastic IP and NAT Gateway in the first public subnet.

## Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `region_selection` | AWS region to deploy resources | string | `us-east-1` |
| `vpc_cidr` | CIDR block for the VPC | string | `10.0.0.0/16` |
| `public_subnet_cidrs` | CIDR blocks for public subnets | list | `["10.0.1.0/24", "10.0.2.0/24"]` |
| `private_subnet_cidrs` | CIDR blocks for private subnets | list | `["10.0.10.0/24", "10.0.11.0/24"]` |
| `vpc_name` | Name tag for the VPC | string | `simple-vpc` |
| `enable_nat_gateway` | Enable NAT Gateway | bool | `false` |
| `enable_dns_hostnames` | Enable DNS hostnames | bool | `true` |
| `enable_dns_support` | Enable DNS support | bool | `true` |

## Outputs

After applying, view outputs with:

```bash
terraform output
```

Key outputs:
- `vpc_id` - VPC ID for reference in other projects
- `public_subnet_ids` - Use these for public instances (web servers, etc.)
- `private_subnet_ids` - Use these for private instances (databases, etc.)
- `internet_gateway_id` - IGW ID
- `nat_gateway_id` - NAT Gateway ID (if enabled)

## Usage Examples

### Launch an EC2 Instance in Public Subnet

```hcl
resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = terraform_remote_state.vpc.outputs.public_subnet_ids[0]
  
  tags = {
    Name = "web-server"
  }
}
```

### Launch a Database in Private Subnet

```hcl
resource "aws_db_instance" "main" {
  allocated_storage      = 20
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_subnet_group_name   = aws_db_subnet_group.main.name
  skip_final_snapshot    = true
}
```

## Destroy Resources

To delete all created resources:

```bash
terraform destroy
```

## Best Practices

1. **CIDR Planning**: Choose CIDR blocks that don't overlap with your other networks
2. **Subnet Distribution**: Spread subnets across multiple AZs for high availability
3. **NAT Gateway Costs**: NAT Gateway charges hourly + data processing. Consider only enabling for prod
4. **Security Groups**: Add security groups in addition to NACLs for better access control
5. **VPC Flow Logs**: Enable for monitoring and troubleshooting network traffic

## Troubleshooting

### Subnet creation fails with "Invalid CIDR"
- Ensure CIDR blocks are valid and within the VPC CIDR range
- Example: VPC `10.0.0.0/16` can contain subnets up to `10.0.255.0/24`

### Cannot reach internet from private subnet
- Ensure `enable_nat_gateway = true`
- Verify NAT Gateway is in the running state

### IP address conflicts
- Check if your local network uses the same CIDR ranges
- Adjust `vpc_cidr` or subnet CIDRs in variables

## Additional Resources

- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [VPC Best Practices](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-best-practices.html)

## License

MIT
