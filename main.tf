resource "spotify_playlist" "terrafy" {
  name        = "Terrafy"
  description = "Managed using Terraform (https://github.com/hknutsen/terrafy)"
  public      = true

  tracks = [
    for track in data.spotify_track.terrafy : track.id
  ]
}

data "spotify_track" "terrafy" {
  for_each = toset(yamldecode(file("config.yml")).track_urls)

  url = each.value
}
