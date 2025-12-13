{
  programs = {
    sway = {
      enable = false;
      wrapperFeatures.gtk = true;
      extraPackages = [];
    };
    nix-ld.enable = true;
    xfconf.enable = true;
    fish.enable = true;
    zsh.enable = true;
    dconf.enable = true;
    # ssh.startAgent = true;
  };
}
