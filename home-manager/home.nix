{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "quartz";
  home.homeDirectory = "/home/quartz";

  home.packages = [
    pkgs.btop
    # pkgs.plover.dev
    pkgs.kate
    pkgs.flutter
    pkgs.olm
	pkgs.imagemagick
	pkgs.prusa-slicer
  ];

  programs.git = {
    enable = true;
    signing = {
      key = "5988C79CE5551B91";
      signByDefault = true;
    };
    userEmail = "rosegayming@riseup.net";
    userName = "Rose Quartz";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
