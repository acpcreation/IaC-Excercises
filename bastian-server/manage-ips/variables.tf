variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bastion_security_group_id" {
  description = "ID of the existing bastion security group to manage SSH rules for"
  type        = string
  default     = "sg-0fb441a982c085d4a"
}

variable "ssh_cidr_blocks" {
  description = "Map of SSH CIDR blocks to allow access to bastion server"
  type        = map(object({
    cidr_block  = string
    description = string
  }))
  default = {
    "admin_home" = {
      cidr_block  = "174.177.37.228/32"
      description = "Admin home IP"
    },
    "dev-1-house" = {
      cidr_block  = "174.177.37.200/32"
      description = "Dev 1 home IP"
    }
    # Example of additional IPs that can be added:
    # "office_network" = {
    #   cidr_block  = "10.0.0.0/16" 
    #   description = "Office network"
    # }
    # "vpn_gateway" = {
    #   cidr_block  = "203.0.113.0/24"
    #   description = "VPN gateway subnet"
    # }
  }
}

variable "common_ssh_port" {
  description = "SSH port for the bastion server"
  type        = number
  default     = 22
}