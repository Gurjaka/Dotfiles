{pkgs, ...}: {
  programs.dwl = {
    enable = false;
    package =
      (pkgs.dwl.override {
        configH = ./dwl-config.h;
      }).overrideAttrs (oldAttrs: {
        buildInputs =
          oldAttrs.buildInputs or []
          ++ [
            pkgs.libdrm
            pkgs.fcft
            pkgs.pixman
          ];
        patches =
          oldAttrs.patches or []
          ++ [
            ./patches/bar.patch
          ];
      });
    extraSessionCommands = ''
      foot --server &
      wallrandom &
    '';
  };
}
