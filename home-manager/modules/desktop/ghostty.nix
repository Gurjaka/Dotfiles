{
  inputs,
  pkgs,
  selectedTheme,
  shell,
  ...
}: let
  ghosttyShell = pkgs.writeShellScript "ghostty-shell" ''
    export PATH=${pkgs.stdenv.cc}/bin:${pkgs.bash}/bin:${pkgs.coreutils}/bin:$PATH
    [ -n "$PWD" ] && unset PWD
    [ -n "$SHLVL" ] && unset SHLVL
    exec ${pkgs.${shell}}/bin/${shell}
  '';
in {
  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.${pkgs.system}.default;
    settings = {
      theme = "dynamic";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 12;
      window-padding-x = 20;
      window-padding-y = 20;
      confirm-close-surface = false;
      gtk-single-instance = true;
      quit-after-last-window-closed = true;
      command = "${ghosttyShell}";
    };
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    themes = {
      dynamic = {
        background = selectedTheme.colors.base01;
        foreground = selectedTheme.colors.base05;
        cursor-color = selectedTheme.colors.base08;
        palette = [
          "0=${selectedTheme.colors.base02}"
          "1=${selectedTheme.colors.base11}"
          "2=${selectedTheme.colors.base14}"
          "3=${selectedTheme.colors.base13}"
          "4=${selectedTheme.colors.base09}"
          "5=${selectedTheme.colors.base15}"
          "6=${selectedTheme.colors.base08}"
          "7=${selectedTheme.colors.base07}"
          "8=${selectedTheme.colors.base03}"
          "9=${selectedTheme.colors.base11}"
          "10=${selectedTheme.colors.base14}"
          "11=${selectedTheme.colors.base13}"
          "12=${selectedTheme.colors.base09}"
          "13=${selectedTheme.colors.base15}"
          "14=${selectedTheme.colors.base07}"
          "15=${selectedTheme.colors.base06}"
        ];
        selection-background = selectedTheme.colors.base07;
        selection-foreground = selectedTheme.colors.base01;
      };
    };
  };
}
