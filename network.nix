{config, ...}: {
  networking = {
    hostName = "mrow"; # Define your hostname.
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
    nameservers = ["1.1.1.1"];

    nat = {
      enable = true;
      internalInterfaces = ["ve-+"];
      externalInterface = "eno1";
      # Lazy IPv6 connectivity for the container
      enableIPv6 = true;
    };
    hosts = {
      # 127.0.0.1 modules-cdn.eac-prod.on.epicgames.com
      "127.0.0.1" = ["modules-cdn.eac-prod.on.epicgames.com"];
    };

    # Open ports in the firewall.
    firewall.allowedTCPPorts = [41641 8000 25565 25510 6567];
    firewall.allowedUDPPorts = [41641 8000 25565 25510 6567];
    firewall.checkReversePath = "loose";
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
  };
  # TODO: Use this isntead
  # systemd.network = {
  # netdevs = {
  # he-ipv6 = {
  # netdevConfig = {
  # Kind = "sit";
  # MTUBytes = 1480;
  # };
  # tunnelConfig = {
  # Local = "192.168.1.100";
  # Remote = "216.66.38.58";
  # TTL = 255;
  # };
  # };
  # };
  # networks = {
  # he-ipv6 = {
  # matchConfig = {
  # Name = "he-ipv6";
  # };
  #
  # address = "2001:470:1c:382::2/64";
  # gateway = "216.66.38.58";
  # dns = [ "2001:4860:4860::8888" "2001:4860:4860::8844" ];
  # };
  # };
  # };

  systemd.services.he-ipv6 = {
    enable = false;
    description = "he.net IPv6 Tunnel";
    after = ["network.target"];
    wantedBy = ["multi-user.target"];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = "yes";
      ExecStart = [
        "/run/current-system/sw/bin/ip tunnel add he-ipv6 mode sit remote 216.66.38.58 local 192.168.1.100 ttl 255"
        "/run/current-system/sw/bin/ip link set he-ipv6 up mtu 1480"
        "/run/current-system/sw/bin/ip addr add 2001:470:1c:382::2 dev he-ipv6"
        "/run/current-system/sw/bin/ip - 6 route add ::/0 dev he-ipv6"
      ];
      ExecStop = [
        "/run/current-system/sw/bin/ip - 6 route del ::/0 dev he-ipv6"
        "/run/current-system/sw/bin/ip link set he-ipv6 down"
        "/run/current-system/sw/bin/ip tunnel del he-ipv6"
      ];
    };
  };
}
