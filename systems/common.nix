{
  config,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 8;
        editor = false;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME = "\${HOME}/.local/bin";
    XDG_DATA_HOME = "\${HOME}/.local/share";
    # Adds to path; doesn't replace
    PATH = [
      "\${XDG_BIN_HOME}"
    ];
    __GL_YIELD = "usleep"; # fixes plasma system stutter on notif recieve. TODO: find out what this actually does and move to a better place
  };

  environment.systemPackages = with pkgs; [
    alejandra
    micro
    nushell
  ];

  networking = {
    nameservers = ["9.9.9.9" "149.112.112.112"];
    wireless.enable = true;
    wireless.userControlled.enable = true;
  };

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  services = {
    openssh.enable = true;
    openssh.openFirewall = true;
    tailscale.enable = true;
  };

  nix = {
    settings = {
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      experimental-features = ["nix-command" "flakes"];
    };
  };
  system.stateVersion = "22.11";
}
