variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.nano"
}

variable "region_selection" {
  description = "Region to deploy to"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2 in us-east-1
}