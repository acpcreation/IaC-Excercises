variable "subnet_id" {
  type        = string
  description = "Subnet ID to create the ENI in"
}

variable "description" {
  type        = string
  description = "Description for the network interface"
}

variable "source_dest_check" {
  type        = bool
  description = "Whether source/destination check is enabled"
}

variable "security_groups" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the network interface"
}