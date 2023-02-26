{config, ...}: {
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };
    dconf.enable = true;
  };

  environment.sessionVariables = rec {
    # Steam needs this to find Proton-GE
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
  nixpkgs.config.allowUnfree = true;
}
