variable "cloudflare_dns_records" {
  description = "Cloudflare zone records"

  type = list(object({
    name      = string,
    content   = string,
    type      = optional(string, "A"),
    comment   = optional(string),
    proxied   = optional(bool, true),
    tags      = optional(list(string), []),
    ttl       = optional(number, 3600),
    zone_name = optional(string),
  }))

  validation {
    condition     = length(var.cloudflare_dns_records) > 0
    error_message = "The cloudflare_dns_records variable must contain at least one DNS record."
  }
}