{config, ...}: {
  services.owncast = {
    enable = true;
    openFirewall = true;
    listen = "0.0.0.0";
  };

  services.caddy = {
    enable = true;
    virtualHosts."owncast.q4.gay:443".extraConfig = ''
      encode gzip
      reverse_proxy 127.0.0.1:8080
    '';
  };

  networking.firewall.allowedTCPPorts = [80 443];
}
