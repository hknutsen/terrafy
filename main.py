import spotipy

sp = spotipy.oauth2.SpotifyClientCredentials()

token = sp.get_access_token(as_dict=False, check_cache=False)

print(token)
