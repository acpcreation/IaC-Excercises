variable "athena_workgroups" {
  description = "Map of Athena workgroup configurations"
  type = map(object({
    name                               = string
    state                              = string
    enforce_workgroup_configuration    = bool
    publish_cloudwatch_metrics_enabled = bool
    requester_pays_enabled             = bool
    selected_engine_version            = string
  }))
  default = {}
}