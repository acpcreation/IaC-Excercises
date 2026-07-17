variable "domain" {
  description = "Indicates if this EIP is for use in VPC"
  type        = string
}

variable "network_border_group" {
  description = "Location from which the IP address is advertised"
  type        = string
}

variable "public_ipv4_pool" {
  description = "EC2 IPv4 address pool identifier"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the EIP"
  type        = map(string)
}