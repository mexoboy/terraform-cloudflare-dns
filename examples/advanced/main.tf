module "dns" {
  source = "../.."

  cloudflare_dns_records = [
    # example.com zone records
    {
      name    = "api.example.com"
      content = "192.0.2.10"
      comment = "API server"
    },
    {
      name    = "www.example.com"
      content = "192.0.2.11"
      proxied = true
      tags    = ["web", "production"]
    },
    {
      name    = "mail.example.com"
      content = "mail.example.com"
      type    = "MX"
      proxied = false
      ttl     = 7200
    },
    
    # mycompany.org zone records
    {
      name    = "app.mycompany.org"
      content = "203.0.113.20"
      comment = "Application server"
      tags    = ["app"]
    },
    {
      name    = "staging.mycompany.org"
      content = "203.0.113.21"
      proxied = false
      ttl     = 300
      tags    = ["staging", "development"]
    },
    {
      name    = "blog.mycompany.org"
      content = "blog.mycompany.org"
      type    = "CNAME"
      proxied = true
    },
    
    # Complex domain example (co.uk)
    {
      name      = "api.example.co.uk"
      content   = "198.51.100.30"
      zone_name = "example.co.uk"
      comment   = "UK API server with manual zone override"
    }
  ]
}