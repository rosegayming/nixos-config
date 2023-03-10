{
  config,
  pkgs,
  ...
}: {
  users.users = {
    quartz = {
      isNormalUser = true;
      extraGroups = ["wheel" "video" "rtkit" "audio"];
      uid = 1000;
    };
    maya = {
      isNormalUser = true;
      extraGroups = ["wheel" "video" "rtkit" "audio"];
      uid = 1001;
    };
    minecraf = {
      isNormalUser = true;
      extraGroups = [];
      uid = 1002;
    };
  };
}
