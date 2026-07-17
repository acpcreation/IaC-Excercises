variable "network_acls" {
  description = "Map of network ACL configurations"
  type = map(object({
    vpc_id     = string
    subnet_ids = list(string)
    ingress = list(object({
      rule_no    = number
      action     = string
      protocol   = string
      cidr_block = string
      from_port  = number
      to_port    = number
    }))
    egress = list(object({
      rule_no    = number
      action     = string
      protocol   = string
      cidr_block = string
      from_port  = number
      to_port    = number
    }))
  }))
  default = {}
}