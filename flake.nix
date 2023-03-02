{
  #TODO: Fix agenix
  description = "quartz's system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
    plover-flake.url = "github:dnaq/plover-plugin-flake";
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    agenix,
    plover-flake,
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = (
      import ./systems {
        inherit (nixpkgs) lib;
        inherit inputs pkgs agenix;
      }
      # mrow = lib.nixosSystem {
      #   inherit system;
      #   modules = [
      #     (import ./systems/mrow inputs)
      #     agenix.nixosModules.default
      #   ];
      # };
    );
    homeConfigurations.quartz = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [./home-manager/home.nix];

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
    };
  };
}
