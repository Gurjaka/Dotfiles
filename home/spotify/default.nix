{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  # import the flake's module for your system
  imports = [ spicetify-nix.homeManagerModule ];

  # configure spicetify :)
  programs.spicetify =
    {
      enable = true;
      theme = spicePkgs.themes.comfy;
      colorScheme = "nord";
      nordColorScheme = {
        text = "ECEFF4";
        subtext = "D8DEE9";
        main = "2E3440";
        main-elevated = "2E3440";
        main-transition = "2E3440";
        highlight = "2E3440";
        highlight-elevated = "2E3440";
        sidebar = "2E3440";
        player = "2E3440";
        card = "3B4252";
        shadow = "4C566A";
        selected-row = "E5E9F0";
        button = "5E81AC";
        button-active = "434C5E";
        button-disabled = "434E5E";
        tab-active = "434C5E";
        notification = "5E81AC";
        notification-error = "BF616A";
        misc = "2E3440";
        play-button = "BF616A";
        play-button-active = "BF616A";
        progress-fg = "BF616A";
        progress-bg = "4C566A";
        heart = "BF616A";
        pagelink-active = "BF616A";
        radio-btn-active = "BF616A";
      };

      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplayMod
        shuffle # shuffle+ (special characters are sanitized out of ext names)
        hidePodcasts
        powerBar
        adblock
        volumePercentage
      ];
    };
}