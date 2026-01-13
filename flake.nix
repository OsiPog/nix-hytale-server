{
  description = "Hytale Servers";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    blueprint.url = "github:osipog/blueprint/feat/allow-nixpkgs-package-definitions";
    blueprint.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs: inputs.blueprint {inherit inputs;};
}
