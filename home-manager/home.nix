{
  config,
  pkgs,
  ...
}: {
  # TODO: Also make home manager not suck idc rn I just want buildable system
  home.username = "quartz";
  home.homeDirectory = "/home/quartz";

  home.packages = with pkgs; [
    # System
    btop
    dwarfs
    fish
    python311
    temurin-bin
    kitty
    qbittorrent
    qmk
    temurin-bin
    unrar
    liquidsoap
    unzip

    # Development

    ## Utilities
    automake
    clang
    gh
    gnumake
    kate
    kompare
    mold
    qtcreator
    rustup
    sapling

    ## Libs
    hidapi
    libusb1
    llvmPackages.libunwind
    mbedtls
    olm
    qt6.full

    # nix
    graphviz
    nil
    nix-du
    zgrviewer

    # Media
    calibre
    cider
    digikam
    furnace
    gimp
    imagemagick
    libgen-cli
    mpv
    qpwgraph
    syncplay
    vlc

    # Games
    lutris
    mindustry
    minecraft
    packwiz
    prismlauncher
    winePackages.stagingFull
    winetricks

    # Social
    discord
    mumble
    nheko
    thunderbird

    # Misc
    ark
    firefox
    ffmpeg_5-full
    obs-studio
    obsidian
    libsForQt5.ksystemlog
    gamemode
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
    # enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      matklad.rust-analyzer
      dracula-theme.theme-dracula
      bungcip.better-toml
      jnoortheen.nix-ide
    ];
    # userSettings = {
    #   workbench.colorTheme = "Sweet Dracula";
    #   nix = {
    #     enableLanguageServer = true;
    #     serverPath = "nil";
    #     serverSettings = {
    #       nil = {
    #         formatting.command = ["alejandra"];
    #       };
    #     };
    #   };
    # };
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
