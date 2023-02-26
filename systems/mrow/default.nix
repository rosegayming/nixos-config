{
  config,
  pkgs,
  # agenix,
  ...
}: {
  imports =
    [(import ../../systems/common-desktop.nix)]
    ++ [(import ./hardware-configuration.nix)]
    ++ [(import ../../modules/hardware/keyboard.nix)]
    ++ [(import ../../modules/hardware/u2f.nix)]
    ++ [(import ../../modules/steam.nix)]
    ++ [(import ../../users.nix)]
    ++ [(import ../../modules/desktops/plasma/default.nix)]
    ++ (import ../../modules/services);

  environment.systemPackages = with pkgs; [
    wget
    wireguard-tools
  ];

  networking = {
    hostName = "mrow"; # Define your hostname.
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

    hosts = {
      "127.0.0.1" = ["modules-cdn.eac-prod.on.epicgames.com"];
    };

    # Open ports in the firewall.
    firewall = {
      enable = true;
      allowedTCPPorts = [41641 8000 25565 25510 6567];
      allowedUDPPorts = [41641 8000 25565 25510 6567];
      checkReversePath = "loose";
    };
  };
}
# cock

