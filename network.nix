{ config, ... }:

{
  networking = {
    hostName = "mrow"; # Define your hostname.
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
    nameservers = [ "1.1.1.1" ];

    nat = {
      enable = true;
      internalInterfaces = [ "ve-+" ];
      externalInterface = "eno1";
      # Lazy IPv6 connectivity for the container
      enableIPv6 = true;
    };
    hosts = {
      # 127.0.0.1 modules-cdn.eac-prod.on.epicgames.com
      "127.0.0.1" = [ "modules-cdn.eac-prod.on.epicgames.com" ];
    };

    # Open ports in the firewall.
    firewall.allowedTCPPorts = [ 41641 8000 25565 25510 6567 ];
    firewall.allowedUDPPorts = [ 41641 8000 25565 25510 6567 ];
    firewall.checkReversePath = "loose";
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;


  };
}
