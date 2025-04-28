{pkgs}:
pkgs.writeShellScriptBin "pyshell" ''
  cat > shell.nix << 'EOF'
  let
  	pkgs = import <nixpkgs> {};
  in
  pkgs.mkShell {
  	packages = [
  		(pkgs.python3.withPackages (python-pkgs:
  			with python-pkgs; [
  				pip
  			]))
  	];
  }
  EOF
''
