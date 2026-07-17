variable "cloudformation_stacks" {
  description = "Map of CloudFormation stack configurations"
  type = map(object({
    name             = string
    capabilities     = list(string)
    disable_rollback = bool
    parameters       = map(string)
  }))
  default = {}
}