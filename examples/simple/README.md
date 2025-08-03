# Simple DNS record example

Creates a single A record using automatic zone detection.

## Usage

```bash
export CLOUDFLARE_API_TOKEN="your_token_here"
terraform init
terraform apply
```

## What it does

- Creates `basic.example.com` → `192.0.2.1` 
- Zone `example.com` is automatically detected from the record name
- Uses default values (A record, proxied=true, ttl=3600)