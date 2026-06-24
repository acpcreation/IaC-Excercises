variable "domain" {
  type        = string
  description = "Whether the EIP is for use in VPC"
}

variable "network_interface_id" {
  type        = string
  description = "Network interface ID to associate with"
}

variable "network_border_group" {
  type        = string
  description = "Location from which the IP address is advertised"
}

variable "public_ipv4_pool" {
  type        = string
  description = "EC2 IPv4 address pool identifier"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the EIP"
}