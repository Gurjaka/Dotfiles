{pkgs, ...}: {
  imports = [./settings.nix];
  home.packages = [
    (pkgs.discord.override {
      withVencord = true;
    })
  ];
  xdg.configFile."Vencord/themes/nord.css".source = ./nord.css;
}
