variable "instances" {
  description = "Map of EC2 instance configurations"
  type = map(object({
    ami                    = string
    instance_type          = string
    availability_zone      = string
    key_name               = string
    subnet_id              = string
    vpc_security_group_ids = list(string)
    iam_instance_profile   = string
    source_dest_check      = bool
    tenancy                = string
    monitoring             = bool
    tags                   = map(string)
  }))
  default = {}
}