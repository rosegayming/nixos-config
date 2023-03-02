{
  agenix,
  lib,
  inputs,
  pkgs,
  ...
}: let
  system = "x86_64-linux";
in {
  mrow = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs;
    };
    modules = [
      ./mrow
      agenix.nixosModules.default
    ];
  };
}
