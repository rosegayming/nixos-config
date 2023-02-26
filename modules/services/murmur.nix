{
  # agenix,
  config,
  ...
}: {
  # age.secrets.murmur.file = ../../secrets/murmur.age;

  # environment.systemPackages = [
  #   agenix.packages.x86_64-linux.default
  # ];

  services.murmur = {
    enable = true;
    openFirewall = true;
    port = 12345;
    bandwidth = 256000;
    # password = "$MURMURD_PASSWORD";
    # environmentFile = config.age.secrets.murmur.path;
  };
}
