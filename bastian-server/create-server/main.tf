# Data source to get the specified VPC
data "aws_vpc" "selected" {
  id = var.vpc_id
}

# Data source to get public subnets from the VPC
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  
  filter {
    name   = "state"
    values = ["available"]
  }
  
  # Try to get public subnets - those with route to internet gateway
  tags = {
    Tier = "Public"
  }
}

# Fallback: get all subnets if no public subnets found
data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  
  filter {
    name   = "state"
    values = ["available"]
  }
}

# Data source to get the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Data source to get existing security group for SSH CIDR blocks (optional)
data "aws_security_group" "source_sg" {
  count = var.source_security_group_id != "" ? 1 : 0
  id    = var.source_security_group_id
}

# Local values for SSH CIDR blocks
locals {
  # Extract CIDR blocks for backward compatibility
  final_ssh_cidrs = [for rule in var.allowed_ssh_cidr_blocks : rule.cidr_block]
}

# Security group for bastion server
resource "aws_security_group" "bastion" {
  name        = "bastion-security-group"
  description = "Security group for bastion server"
  vpc_id      = data.aws_vpc.selected.id

  # SSH access from specified IP addresses - individual rules with descriptions
  dynamic "ingress" {
    for_each = var.allowed_ssh_cidr_blocks
    content {
      description = ingress.value.description
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [ingress.value.cidr_block]
    }
  }

  # Allow all outbound traffic
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-security-group"
    Type = "bastion"
  }
}

# EC2 instance for bastion server
resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type              = var.instance_type
  vpc_security_group_ids     = [aws_security_group.bastion.id]
  subnet_id                  = length(data.aws_subnets.public.ids) > 0 ? data.aws_subnets.public.ids[0] : data.aws_subnets.all.ids[0]
  associate_public_ip_address = true

  # User data script to update the system
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y htop vim
    
    # Configure SSH
    sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
    systemctl restart sshd
  EOF

  tags = {
    Name = var.bastion_name
    Type = "bastion"
    Role = "jump-server"
  }
}

# Elastic IP for bastion server
resource "aws_eip" "bastion" {
  instance = aws_instance.bastion.id
  domain   = "vpc"

  tags = {
    Name = "${var.bastion_name}-eip"
    Type = "bastion"
  }

  depends_on = [aws_instance.bastion]
}