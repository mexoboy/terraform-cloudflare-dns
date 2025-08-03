# Advanced Multi-Zone Example

Creates multiple DNS records across different zones with various record types and configurations.

## Usage

```bash
export CLOUDFLARE_API_TOKEN="your_token_here"
terraform init
terraform apply
```

## What it demonstrates

- **Multiple zones**: Records for both `example.com` and `mycompany.org`
- **Record types**: A, MX, and CNAME records
- **Optional parameters**: comments, tags, custom TTL, proxied settings
- **Automatic zone detection**: Each record's zone is determined from its name

## Records created

**example.com zone:**
- `api.example.com` → A record with comment
- `www.example.com` → Proxied A record with tags
- `mail.example.com` → MX record (non-proxied, custom TTL)

**mycompany.org zone:**
- `app.mycompany.org` → A record with comment and tags
- `staging.mycompany.org` → Non-proxied A record with short TTL
- `blog.mycompany.org` → CNAME record

**example.co.uk zone:**
- `api.example.co.uk` → A record with manual zone override (for complex TLD)