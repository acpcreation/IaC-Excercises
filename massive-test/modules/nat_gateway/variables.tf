variable "allocation_id" {
  description = "Allocation ID of the EIP for the NAT gateway"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the NAT gateway"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the NAT gateway"
  type        = map(string)
}