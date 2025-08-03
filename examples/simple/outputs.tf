output "dns_records" {
  description = "Created DNS records"
  value       = module.dns.dns_records
}

output "created_records_count" {
  description = "Number of DNS records created"
  value       = module.dns.created_records_count
}