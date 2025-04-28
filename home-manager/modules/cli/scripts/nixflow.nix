{pkgs}:
pkgs.writeShellScriptBin "nixflow" ''
  mkdir -p .github/workflows
  cat > flake-checkyml << EOF
  name: Nix Flake Check

  on:
    push:
      branches:
        - main
        - master
    pull_request:

  jobs:
    flake-check:
      runs-on: ubuntu-latest
      steps:
        - name: Checkout repository
          uses: actions/checkout@v4

        - name: Install Nix
          uses: cachix/install-nix-action@v26

        - name: Run nix flake check
          run: nix flake check
  EOF
''
