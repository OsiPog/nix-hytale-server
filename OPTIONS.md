# NixOS Module Options


## [`services.hytale-server.enable`](modules/nixos/hytale-server.nix#L14)

Hytale game server

**Type:** `boolean`

**Default:** `false`

**Example:** `true`

## [`services.hytale-server.user`](modules/nixos/hytale-server.nix#L15)

The user the server will be run as.

**Type:** `types.str`

**Default:** `"hytale"`

## [`services.hytale-server.group`](modules/nixos/hytale-server.nix#L20)

The group under which the server will be run.

**Type:** `types.str`

**Default:** `"hytale"`

## [`services.hytale-server.stateDir`](modules/nixos/hytale-server.nix#L25)

The directory where the server files will be created.

**Type:** `types.pathWith {absolute = true;}`

**Default:** `"/var/lib/hytale-server"`

## [`services.hytale-server.port`](modules/nixos/hytale-server.nix#L30)

The UDP port the server will be bound to.

**Type:** `types.port`

**Default:** `5520`

## [`services.hytale-server.openFirewall`](modules/nixos/hytale-server.nix#L35)

opening the firewall on the defined UDP port

**Type:** `boolean`

**Default:** `false`

**Example:** `true`

## [`services.hytale-server.hytaleDownloaderPackage`](modules/nixos/hytale-server.nix#L36)

Package that contains the hytale-downloader binary

**Type:** `types.package`

**Default:** `pkgs.callPackage ../../packages/hytale-downloader/default.nix {}`

## [`services.hytale-server.extraJvmOpts`](modules/nixos/hytale-server.nix#L41)

Additional options passed to the java command that runs the server.

**Type:** `with types; listOf str`

**Default:** `[]`

**Example:** `["-Xms6G" "-Xmx6G"]`

## [`services.hytale-server.useRecommendedJvmOpts`](modules/nixos/hytale-server.nix#L47)

using the recommended JVM options from https://github.com/RVSkeLe/Hytale-SelfHosted

**Type:** `boolean`

**Default:** `false`

**Example:** `true`

---
*Generated with [nix-options-doc](https://github.com/Thunderbottom/nix-options-doc)*
