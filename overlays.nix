{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    (inputs.qtile-flake.overlays.default)
    (final: prev: {
      pythonPackagesExtensions =
        prev.pythonPackagesExtensions
        ++ [
          (python-final: python-prev: {
            qtile-extras = python-prev.qtile-extras.overridePythonAttrs (oldAttrs: {
              src = inputs.qtile-extras-flake.outPath;
              propagatedBuildInputs = with pkgs.python3Packages; [dbus-fast];
              # disable broken tests
              disabledTestPaths =
                oldAttrs.disabledTestPaths
                ++ [
                  "test/widget/test_animated_image.py"
                  "test/widget/test_groupbox2.py"
                  "test/widget/test_image.py"
                ];
            });
          })
        ];
    })
  ];
}
