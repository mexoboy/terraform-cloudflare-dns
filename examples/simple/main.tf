module "dns" {
  source = "mexoboy/dns/cloudflare"
  version = "v1.0.0"

  cloudflare_dns_records = [
    {
      name    = "basic.example.com"
      content = "192.0.2.1"
    }
  ]
}