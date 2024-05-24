variable "spotify_api_key" {
  description = "The API key output by the authorization server."
  type        = string
  sensitive   = true
}

locals {
  track_urls = {
    "Starpoint - Object of My Desire" = "https://open.spotify.com/track/63Ql2zSLiBryLRPihaUToK?si=64a194652176418c"
  }
}
