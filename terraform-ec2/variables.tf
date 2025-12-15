# Name for the web server and related resources
# This will be used as a prefix for resource names and tags
variable "server_name" {
  description = "Name for the web server instance"
  default     = "ap-sg-server"
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

# Amazon Machine Image (AMI) - the operating system template
# This AMI is for Amazon Linux 2 in us-east-1 region
variable "ami" {
  description = "EC2 AMI ID"
  default     = "ami-01b799c439fd5516a"
}

# Path to the SSH public key file on your local machine
# This key will be used for secure access to the EC2 instance
variable "public_key_path" {
  description = "Path to the public key file"
  default     = "~/.ssh/id_rsa.pub"
}

