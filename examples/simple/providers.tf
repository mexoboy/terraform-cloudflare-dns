terraform {
  required_version = ">= 1.0"
  
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.0"
    }
  }
}

provider "cloudflare" {
  # Configure via environment variables:
  # CLOUDFLARE_API_TOKEN or CLOUDFLARE_EMAIL + CLOUDFLARE_API_KEY
}