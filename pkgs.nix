# { plover-flake, ... }:
{ pkgs, ... }:

{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };

  environment.systemPackages = [
    pkgs.micro
    pkgs.nushell
    pkgs.wget
    pkgs.ark
    pkgs.xclip
    pkgs.prismlauncher
    pkgs.nixpkgs-fmt
    pkgs.ansible
    pkgs.python311
    pkgs.arcanPackages.all-wrapped
    # plover-flake.packages.${pkgs.system}.plover
    pkgs.wine-staging
    pkgs.winetricks
    pkgs.temurin-bin
  ];

}