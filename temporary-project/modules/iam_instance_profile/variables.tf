variable "name" {
  type        = string
  description = "Name of the instance profile"
}

variable "path" {
  type        = string
  description = "Path to the instance profile"
}

variable "role" {
  type        = string
  description = "Name of the IAM role to associate with the profile"
}