{user, ...}: {
  programs.nh = {
    enable = true;
    flake = "/home/${user}/Dotfiles";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 3 --keep-since 3d";
    };
  };
}
