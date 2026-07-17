variable "internet_gateways" {
  description = "Map of internet gateway configurations"
  type = map(object({
    vpc_id = string
    tags   = map(string)
  }))
  default = {}
}