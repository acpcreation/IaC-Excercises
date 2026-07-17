variable "ami_id" {
  type        = string
  description = "AMI ID to use for the instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for the instance"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to launch the instance in"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile name"
}

variable "key_name" {
  type        = string
  description = "Key pair name"
}

variable "source_dest_check" {
  type        = bool
  description = "Whether source/destination check is enabled"
}

variable "tenancy" {
  type        = string
  description = "Tenancy of the instance"
}

variable "ebs_optimized" {
  type        = bool
  description = "Whether the instance is EBS-optimized"
}

variable "monitoring" {
  type        = bool
  description = "Whether detailed monitoring is enabled"
}

variable "metadata_http_endpoint" {
  type        = string
  description = "Whether the metadata service is available"
}

variable "metadata_http_protocol_ipv6" {
  type        = string
  description = "Whether the IPv6 endpoint for IMDS is enabled"
}

variable "metadata_http_put_response_hop_limit" {
  type        = number
  description = "HTTP PUT response hop limit for instance metadata requests"
}

variable "metadata_http_tokens" {
  type        = string
  description = "Whether session tokens are required for IMDS"
}

variable "metadata_instance_metadata_tags" {
  type        = string
  description = "Whether instance tags are accessible via IMDS"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the instance"
}