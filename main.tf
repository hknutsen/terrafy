resource "spotify_playlist" "terrafy" {
  name        = "Terrafy"
  description = ""
  public      = true

  tracks = [
    for track in data.spotify_track.terrafy : track.id
  ]
}

data "spotify_track" "terrafy" {
  for_each = local.track_urls

  url = each.value
}
