{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
    # wine-8.url = "github:SFrijters/nixpkgs/wine-8";
    # plover-flake.url = "github:dnaq/plover-plugin-flake";
  };

  outputs = {
    self,
    nixpkgs,
    agenix,
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      mrow = lib.nixosSystem {
        inherit system;
        modules = [
          (import ./configuration.nix inputs)
          (import ./pkgs.nix inputs)
          agenix.nixosModules.default
        ];
      };
    };
  };
}
