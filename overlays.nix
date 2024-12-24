{
  inputs,
  pkgs,
  ...
}:

{
  nixpkgs.overlays = [
    (inputs.qtile-flake.overlays.default)
    (final: prev: {
      pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
        (python-final: python-prev: {
          qtile-extras = python-prev.qtile-extras.overridePythonAttrs (oldAttrs: {
            src = inputs.qtile-extras-flake.outPath;
            nativeCheckInputs = with pkgs.python3Packages; [ dbus-fast ];
          });
        })
      ];
    })
  ];
}
