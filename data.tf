data "cloudflare_zone" "zones" {
  for_each = local.cloudflare_zones
  name     = each.value
}