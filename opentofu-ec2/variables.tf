# Name for the web server and related resources
# This will be used as a prefix for resource names and tags
variable "server_name" {
  description = "Name for the web server instance"
  default     = "ap-sg-server-v2"
}

# EC2 instance size configuration (CPU, memory, network performance)
# t2.micro is eligible for AWS free tier
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "region_selection" {
  description = "Region to deploy to"
  default     = "us-east-1"
}

# Amazon Machine Image (AMI) will be dynamically fetched based on region
# Using data source to get the latest Amazon Linux 2 AMI for the selected region

# Path to the SSH public key file on your local machine
# This key will be used for secure access to the EC2 instance
variable "public_rsa_key" {
  description = "Path to the public key file"
  default     = "~/.ssh/id_rsa.pub"
}

