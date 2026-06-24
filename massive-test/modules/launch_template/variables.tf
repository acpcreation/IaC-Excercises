variable "launch_templates" {
  description = "Map of launch template configurations"
  type = map(object({
    name = string
    tags = map(string)
  }))
  default = {}
}