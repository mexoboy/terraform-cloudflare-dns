# Terraform cloudflare DNS module

A Terraform module for managing Cloudflare DNS records with ease.

## Features

- ✅ **Simplified Configuration**: Create DNS records with just `name` and `content`
- ✅ **Automatic Zone Detection**: No need to specify zone names - automatically determined from DNS record names
- ✅ **Minimal Parameters**: Reduce configuration overhead by using smart defaults (A records, proxied=true, TTL=3600)

## Usage

### Basic example

```hcl
module "dns" {
  source = "github.com/mexoboy/terraform-cloudflare-dns"

  cloudflare_dns_records = [
    {
      name    = "api.example.com"
      content = "192.0.2.1"
    }
  ]
}
```

### Advanced example

```hcl
module "dns" {
  source = "github.com/mexoboy/terraform-cloudflare-dns"

  cloudflare_dns_records = [
    # example.com zone
    {
      name    = "api.example.com"
      content = "192.0.2.10"
      comment = "API server"
      tags    = ["production", "api"]
    },
    {
      name    = "www.example.com"
      content = "192.0.2.11"
      proxied = true
    },
    
    # mycompany.org zone
    {
      name    = "mail.mycompany.org"
      content = "mail.mycompany.org"
      type    = "MX"
      proxied = false
      ttl     = 7200
    }
  ]
}
```

## Requirements

| Name       | Version |
|------------|---------|
| terraform  | >= 1.0  |
| cloudflare | >= 4.0  |

## Providers

| Name       | Version |
|------------|---------|
| cloudflare | >= 4.0  |

## Inputs

| Name                   | Description                              | Type           | Default  | Required  |
|------------------------|------------------------------------------|----------------|----------|:---------:|
| cloudflare_dns_records | List of Cloudflare DNS records to create | `list(object)` | n/a      |    yes    |

### DNS record object structure

| Name      | Description                                             | Type           | Default  | Required  |
|-----------|---------------------------------------------------------|----------------|----------|:---------:|
| name      | The DNS record name (FQDN)                              | `string`       | n/a      |    yes    |
| content   | The DNS record content                                  | `string`       | n/a      |    yes    |
| type      | The DNS record type                                     | `string`       | `"A"`    |    no     |
| comment   | Comment for the DNS record                              | `string`       | `null`   |    no     |
| proxied   | Whether the record should be proxied through Cloudflare | `bool`         | `true`   |    no     |
| tags      | List of tags for the DNS record                         | `list(string)` | `[]`     |    no     |
| ttl       | Time to live for the DNS record                         | `number`       | `3600`   |    no     |
| zone_name | Override automatic zone detection (for complex domains) | `string`       | `null`   |    no     |

## Outputs

| Name                  | Description                                   |
|-----------------------|-----------------------------------------------|
| dns_records           | Map of created DNS records with their details |
| created_records_count | Total number of DNS records created           |

## Zone Detection

The module automatically extracts the zone name from each DNS record's FQDN. For example:

- `api.example.com` → zone: `example.com`
- `subdomain.staging.mycompany.org` → zone: `mycompany.org` 

### Complex domains

For domains with complex TLDs (like `co.uk`, `com.au`), use the `zone_name` parameter:

```hcl
cloudflare_dns_records = [{
  name      = "api.example.co.uk"
  content   = "192.0.2.1"
  zone_name = "example.co.uk"  # Override automatic detection
}]
```

Without `zone_name`, `api.example.co.uk` would incorrectly detect `co.uk` as the zone instead of `example.co.uk`.

## Examples

- [Simple](./examples/simple/) - Single DNS record with minimal configuration
- [Advanced](./examples/advanced/) - Multiple zones with various record types and options

## License

This module is released under the MIT License. See [LICENSE](LICENSE) for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.