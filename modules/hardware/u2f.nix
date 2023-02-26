{config, ...}: {
  services.pcscd.enable = true; #TODO: no clue if this is needed I don't feel like testing

  security.pam = {
    u2f = {
      enable = true;
      cue = true;
      debug = false;
    };
    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
    };
  };
}
