{
  config,
  pkgs,
  ...
}: {
  services.udev.packages = [pkgs.via];
  environment.systemPackages = with pkgs; [
    via
  ];
}
