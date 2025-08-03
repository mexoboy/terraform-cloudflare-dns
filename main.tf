resource "cloudflare_record" "zone_records" {
  count = length(var.cloudflare_dns_records)
  name  = var.cloudflare_dns_records[count.index].name
  zone_id = data.cloudflare_zone.zones[local.record_zones[var.cloudflare_dns_records[count.index].name]].id
  comment = var.cloudflare_dns_records[count.index].comment
  content = var.cloudflare_dns_records[count.index].content
  proxied = var.cloudflare_dns_records[count.index].proxied
  tags    = var.cloudflare_dns_records[count.index].tags
  ttl     = var.cloudflare_dns_records[count.index].ttl
  type    = var.cloudflare_dns_records[count.index].type
}