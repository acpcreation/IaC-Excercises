variable "name" {
  type        = string
  description = "Name of the Athena workgroup"
}

variable "state" {
  type        = string
  description = "State of the workgroup (ENABLED or DISABLED)"
}

variable "enforce_workgroup_configuration" {
  type        = bool
  description = "Whether workgroup settings override client-side settings"
}

variable "publish_cloudwatch_metrics_enabled" {
  type        = bool
  description = "Whether CloudWatch metrics are enabled for the workgroup"
}

variable "requester_pays_enabled" {
  type        = bool
  description = "Whether requester pays is enabled"
}

variable "selected_engine_version" {
  type        = string
  description = "Selected Athena engine version"
}