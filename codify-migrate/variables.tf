variable "region" {
  type        = string
  description = "AWS region"
}

variable "iam_role_name" {
  type        = string
  description = "Friendly name of the IAM role"
}

variable "iam_role_path" {
  type        = string
  description = "Path to the role"
}

variable "iam_role_description" {
  type        = string
  description = "Description of the role"
}

variable "iam_role_max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds"
}

variable "iam_role_assume_role_policy" {
  type        = string
  description = "Policy that grants an entity permission to assume the role"
}