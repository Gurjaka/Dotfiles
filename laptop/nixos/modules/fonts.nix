{ config, pkgs, ... }:

{
  # List of fonts installed in system profile.
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    iosevka
    jetbrains-mono
    nerdfonts
    monaspace
    cascadia-code
  ];
}