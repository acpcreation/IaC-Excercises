variable "key_pairs" {
  description = "Map of key pair configurations"
  type = map(object({
    key_name   = string
    public_key = string
  }))
  default = {}
}