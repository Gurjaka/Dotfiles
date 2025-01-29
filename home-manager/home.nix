{user, ...}: {
  imports = [
    ./modules/cli
    ./modules/desktop
    ./modules/theme
    ./modules/gaming
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.11"; # Please read the comment before changing.
    username = "${user}";
    homeDirectory = "/home/${user}";
    # Session
    sessionVariables = {
      TERMINAL = "foot.desktop";
      EDITOR = "nvim";
    };
  };

  # Pkgs
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
