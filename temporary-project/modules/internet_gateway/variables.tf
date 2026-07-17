variable "vpc_id" {
  type        = string
  description = "VPC ID to attach the internet gateway to"
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the internet gateway"
}