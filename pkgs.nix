{ pkgs, ... }:

{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };

  environment.systemPackages = with pkgs; [
    micro # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    nushell
    wget
    ark
    xclip
    prismlauncher
    nixpkgs-fmt
    ansible
    python311
    # openrgb
  ];

}
