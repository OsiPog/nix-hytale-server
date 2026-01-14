# NixOS Module for Hytale Server

At the time of writing nixpkgs does not provide options for running a [Hytale](https://hytale.com/) game server on NixOS. This flake's module adds these options.

## Quickstart

1. Add this flake as an input to your own flake.

```nix
{
  inputs = {
    # ...
    nix-hytale-server.url = "github:osipog/nix-hytale-server";
  }
  # ...
}
```

2. Anywhere in your NixOS configuration import the module and enable the service.

```nix
{
  inputs, # make sure that inputs is exposed in specialArgs
  ...
}: {
  imports = [
    inputs.nix-hytale-server.nixosModules.hytale-server
  ];

  services.hytale-server = {
    enable = true;
    openFirewall = true;
    useRecommendedJvmOpts = true;
  };
}
```

Documentation for all options can be found [here](OPTIONS.md).


3. That the server binaries can be downloaded you need to authenticate the downloader with your Hytale Account. Look into the logs of the `hytale-server` service with for example: `journalctl -f -u hytale-server`. You should see something like this:

```
Jan 14 02:37:52 floating-trees hytale-server-start[339424]: Please visit the following URL to authenticate:
Jan 14 02:37:52 floating-trees hytale-server-start[339424]: https://oauth.accounts.hytale.com/oauth2/device/verify?user_code=AAAAAA
Jan 14 02:37:52 floating-trees hytale-server-start[339424]: Or visit the following URL and enter the code:
Jan 14 02:37:52 floating-trees hytale-server-start[339424]: https://oauth.accounts.hytale.com/oauth2/device/verify
Jan 14 02:37:52 floating-trees hytale-server-start[339424]: Authorization code: AAAAAA
```

Follow the first link and login to your account. After that the binaries and assets will be downloaded and the server will be started.

Now the server is available at port **localhost:5502** (UDP).

For further server configuration consult the [official guide](https://support.hytale.com/hc/en-us/articles/45326769420827-Hytale-Server-Manual#running-a-hytale-server) (Note that for actual online play the server has be authenticated with `/auth login device`).

To run server commands use `hytale-server-cmd <command>` and follow the logs with `journalctl -f -u hytale-server`.
