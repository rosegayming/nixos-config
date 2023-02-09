{ agenix, ... }@inputs:
{ pkgs, ... }:

{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
    dconf.enable = true;
  };

  environment.systemPackages = [
    pkgs.micro
    pkgs.nushell
    pkgs.wget
    pkgs.ark
    pkgs.xclip
    pkgs.prismlauncher
    pkgs.nixpkgs-fmt
    # pkgs.ansible
    pkgs.python311
    pkgs.arcanPackages.all-wrapped
    pkgs.winePackages.stagingFull
    # plover-flake.packages.${pkgs.system}.plover
    # wine-8.packages.${pkgs.system}.wine-staging
    # wine-8.packages.${pkgs.system}.winePackages.stagingFull
    pkgs.winetricks
    pkgs.temurin-bin
    pkgs.clang
    pkgs.mold
    pkgs.llvmPackages.libunwind
    pkgs.mindustry
    pkgs.mindustry-server
    pkgs.via
    pkgs.vial
    pkgs.plover.dev
    inputs.agenix.packages.x86_64-linux.default
  ];

}
