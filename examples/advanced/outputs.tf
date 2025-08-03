output "dns_records" {
  description = "Created DNS records grouped by zone"
  value = {
    for zone_name, records in {
      for record_name, record in module.dns.dns_records :
      join(".", slice(split(".", record_name), -2, -1)) => record...
    } : zone_name => records
  }
}

output "records_by_zone" {
  description = "Number of records created per zone"
  value = {
    for zone_name, records in {
      for record_name, record in module.dns.dns_records :
      join(".", slice(split(".", record_name), -2, -1)) => record...
    } : zone_name => length(records)
  }
}

output "total_records" {
  description = "Total number of DNS records created"
  value       = module.dns.created_records_count
}