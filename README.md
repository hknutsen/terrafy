# Terrafy

A public Spotify playlist managed using Terraform.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) version 1.8
- [Docker Engine](https://docs.docker.com/engine/install/) (Linux) or [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/) (Windows and macOS)
- Spotify account

## Development

Based on [this tutorial](https://developer.hashicorp.com/terraform/tutorials/community-providers/spotify-playlist).

### Create Spotify developer app

1. Login to the [Spotify developer dashboard](https://developer.spotify.com/dashboard/login) and create an app with the following parameters:

     - **App name:** `Terrafy`
     - **App description:** `Create playlists using Terraform (https://github.com/hknutsen/terrafy)`
     - **Redirect URIs:** `http://localhost:27228/spotify_callback`
     - **Which API/SDKs are you planning to use?** Select `Web API`.

### Run Spotify authorization server

1. Create a file `.env` with the following contents:

    ```ini
    SPOTIFY_CLIENT_ID=<SPOTIFY_CLIENT_ID>
    SPOTIFY_CLIENT_SECRET=<SPOTIFY_CLIENT_SECRET>
    ```

    where `<SPOTIFY_CLIENT_ID>` and `<SPOTIFY_CLIENT_SECRET>` are the client ID and client secret of your developer app, respectively. You can find these on the settings page of your developer app.

1. Run the authorization server:

    ```bash
    docker run --rm -it -p 27228:27228 --env-file ./.env ghcr.io/conradludgate/spotify-auth-proxy
    ```

1. Open the output authorization URL and follow the instructions to authorize the developer application to make requests on behalf of your Spotify account.
1. Copy the output API key.

### Apply Terraform configuration

1. Create a file `terraform.tfvars` with the following contents:

    ```ini
    spotify_api_key = "<SPOTIFY_API_KEY>"
    ```

    where `<SPOTIFY_API_KEY>` is the API key output by the authorization server.

1. Initialize the working directory containing the Terraform configuration:

    ```bash
    terraform init
    ```

1. Apply the Terraform configuration:

    ```bash
    terraform apply
    ```
