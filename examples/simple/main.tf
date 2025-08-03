module "dns" {
  source = "../.."

  cloudflare_dns_records = [
    {
      name    = "basic.example.com"
      content = "192.0.2.1"
    }
  ]
}