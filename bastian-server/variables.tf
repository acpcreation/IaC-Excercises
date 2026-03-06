variable "region_selection" {
  description = "Region to deploy to"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The VPC ID where the bastion server will be deployed"
  type        = string
  default     = "vpc-0f3a74a7a458a50c7"
}

variable "instance_type" {
  description = "The EC2 instance type for the bastion server"
  type        = string
  default     = "t3.micro"
}

variable "source_security_group_id" {
  description = "Security Group ID to pull allowed SSH CIDR blocks from"
  type        = string
  default     = ""  # Leave empty to use default CIDR blocks
}

variable "allowed_ssh_cidr_blocks" {
  description = "List of CIDR blocks allowed to SSH to the bastion server (used when source_security_group_id is empty)"
  type        = list(string)
  default     = ["0.0.0.0/0",
                 "174.177.37.229/32"]  # Warning: This allows access from anywhere. Consider restricting to your IP.
}

variable "bastion_name" {
  description = "Name for the bastion server"
  type        = string
  default     = "bastion-server"
}