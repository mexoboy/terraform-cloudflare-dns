output "dns_records" {
  description = "Created DNS records"
  value = {
    for idx, record in cloudflare_record.zone_records :
    record.name => {
      id      = record.id
      name    = record.name
      type    = record.type
      content = record.content
      proxied = record.proxied
      ttl     = record.ttl
      zone_id = record.zone_id
    }
  }
}

output "created_records_count" {
  description = "Number of DNS records created"
  value       = length(cloudflare_record.zone_records)
}