{pkgs}:
pkgs.writeShellScriptBin "pyflake" ''
  cat > flake.nix << 'EOF'
  {
  	description = "Python development flake template";

  	inputs = {
  		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  	};

  	outputs = {
  		self,
  		nixpkgs,
  	}: let
  		supportedSystems = ["x86_64-linux"];
  		forAllSystems = function:
  			nixpkgs.lib.genAttrs supportedSystems (
  				system: function nixpkgs.legacyPackages.''${system}
  			);
  	in {
  		formatter = forAllSystems (pkgs: pkgs.alejandra);

  		devShells = forAllSystems (
  			pkgs: let
  				python-deps = ps:
  					with ps; [
  						pip
  					];
  			in {
  				default =
  					pkgs.mkShell
  					{
  						packages = with pkgs; [
  							(python3.withPackages python-deps)
  							ruff
  						];
  					};
  			}
  		);
  	};
  }
  EOF
''
