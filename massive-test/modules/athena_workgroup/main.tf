resource "aws_athena_workgroup" "this" {
  for_each = var.athena_workgroups

  name  = each.value.name
  state = each.value.state

  configuration {
    enforce_workgroup_configuration    = each.value.enforce_workgroup_configuration
    publish_cloudwatch_metrics_enabled = each.value.publish_cloudwatch_metrics_enabled
    requester_pays_enabled             = each.value.requester_pays_enabled

    engine_version {
      selected_engine_version = each.value.selected_engine_version
    }
  }
}