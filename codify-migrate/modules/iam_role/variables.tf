variable "name" {
  type        = string
  description = "Friendly name of the IAM role"
}

variable "path" {
  type        = string
  description = "Path to the role"
}

variable "description" {
  type        = string
  description = "Description of the role"
}

variable "max_session_duration" {
  type        = number
  description = "Maximum session duration in seconds"
}

variable "assume_role_policy" {
  type        = string
  description = "Policy that grants an entity permission to assume the role"
}