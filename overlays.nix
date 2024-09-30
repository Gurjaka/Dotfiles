{ inputs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      pythonPackagesOverlays =
        (prev.pythonPackagesOverlays or [])
        ++ [
          (python-final: python-prev: {
            qtile-extras = (python-prev.qtile-extras.overrideAttrs (old: {
              # version = inputs.qtile-extras-flake.shortRev;
              # use the source of the git repo
              src = inputs.qtile-extras-flake.outPath;
            }));
          })
        ];
      python3 = let
        self = prev.python3.override {
          inherit self;
          packageOverrides = prev.lib.composeManyExtensions final.pythonPackagesOverlays;
        };
      in
        self;
      python3Packages = final.python3.pkgs;
    })
  ];
}
