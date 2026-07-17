output "nat_gateway_id" {
  description = "NAT gateway ID"
  value       = module.nat_gateway.id
}

output "eip_public_ip" {
  description = "Public IP address of the EIP"
  value       = module.eip.public_ip
}