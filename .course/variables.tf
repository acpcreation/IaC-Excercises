variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.nano"
}

variable "region_selection" {
  description = "Region to deploy to"
  default     = "us-east-1"
}