{pkgs}:
pkgs.writeShellScriptBin "flake-init" ''
  cat > flake.nix << 'EOF'
  {
  	description = "Flake template by Gurjaka";

  	inputs = {
  		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  	};

  	outputs = {
  		self,
  		nixpkgs,
  	}: let
  		supportedSystems = ["x86_64-linux"];
  		forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f nixpkgs.legacyPackages.''${system});

  		flake_attributes = forAllSystems (pkgs: rec {
  			common-system-deps = with pkgs; [
  				# list of dependencies that are system related
  			];

  			shell-env = {
  				# Environmental configuration e.g expose correct library paths
  			};

  			pkgs-wrapped = pkgs.lib.lists.flatten [
  				# Wrap packages into single list e.g system-deps, python-deps, etc...
  				common-system-deps
  			];
  		});
  	in {
  		formatter = forAllSystems (pkgs: pkgs.alejandra);

  		# If your flake is supposed to expose your project/package,
  		# uncomment following and replace [PKGNAME, PKG_DERIVATION] with correct name/path.

  		# packages = forAllSystems (pkgs: {
  		#   default = self.packages.''${pkgs.system}.PKGNAME;
  		#
  		#   PKGNAME = import ./nix/PKG-DERIVATION.nix {inherit pkgs self;};
  		# });

  		devShells = forAllSystems (pkgs: {
  			default = pkgs.mkShell {
  				env = flake_attributes.''${pkgs.system}.shell-env;
  				packages = flake_attributes.''${pkgs.system}.pkgs-wrapped;
  			};
  		});
  	};
  }
  EOF
''
