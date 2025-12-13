{pkgs}:
pkgs.writeShellScriptBin "nix-audit" ''
  exec ${pkgs.python3}/bin/python3 ${./nix-audit.py} "$@"
''
