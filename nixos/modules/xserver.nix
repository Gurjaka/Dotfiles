{
  inputs,
  pkgs,
  ...
}: {
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb.variant = "dvp";
    # Enable Qtile
    windowManager.qtile = {
      enable = true;
      package = inputs.qtile-flake.packages.${pkgs.system}.default;
      extraPackages = python3Packages:
        with python3Packages; [
          (qtile-extras.overridePythonAttrs (oldAttrs: {
            src = inputs.qtile-extras-flake.outPath;
            propagatedBuildInputs =
              (oldAttrs.propagatedBuildInputs or [])
              ++ (with pkgs.python3Packages; [anyio]);
          }))
        ];
    };
    displayManager.startx.enable = true;
    excludePackages = [pkgs.xterm];
  };
}
