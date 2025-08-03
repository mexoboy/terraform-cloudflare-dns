locals {
  cloudflare_zones = toset([
    for record in var.cloudflare_dns_records :
    coalesce(
      record.zone_name,
      join(".", slice(
        split(".", record.name),
        length(split(".", record.name)) - 2,
        length(split(".", record.name))
      ))
    )
  ])
  
  # Create a map of record name to its zone (with fallback)
  record_zones = {
    for record in var.cloudflare_dns_records :
    record.name => coalesce(
      record.zone_name,
      join(".", slice(
        split(".", record.name),
        length(split(".", record.name)) - 2,
        length(split(".", record.name))
      ))
    )
  }
}