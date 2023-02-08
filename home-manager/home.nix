{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "quartz";
  home.homeDirectory = "/home/quartz";

  home.packages = with pkgs;  [
    btop
    kate
    olm
    imagemagick
    prusa-slicer
    nix-du
    graphviz
    zgrviewer
    gh
    qbittorrent
    temurin-bin
    kompare
    mumble
    cider
    packwiz
    minecraft
    obs-studio
    lutris
    syncplay
    mpv
    calibre
    rustup
    sapling
    libgen-cli
    qt6.full
    automake
    hidapi
    libusb1
    mbedtls
    qtcreator
    gnumake
    gcc
    qmk
    unrar
    obsidian
    # itch
    dwarfs
    unzip
    kitty
    gimp
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

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      matklad.rust-analyzer
      dracula-theme.theme-dracula
      bungcip.better-toml
    ];
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  services.easyeffects.enable = true;

  home.sessionVariables = {
    DXVK_ASYNC = "1";
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
