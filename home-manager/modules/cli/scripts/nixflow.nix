{pkgs}:
pkgs.writeShellScriptBin "nixflow" ''
  export WORKFLOW=.github/workflows
  mkdir -p $WORKFLOW
  cat > $WORKFLOW/flake-check.yml << 'EOF'
  name: Nix Flake Check
  on:
    push:
      branches:
        - main
    pull_request:
  jobs:
    flake-check:
      runs-on: ubuntu-latest
      steps:
        - name: Checkout repository
          uses: actions/checkout@v4
        - name: Install Nix
          uses: cachix/install-nix-action@v27
        - name: Run nix flake check
          run: nix flake check --print-build-logs
        - name: Check Nix formatting
          run: |
            nix fmt
            if git diff --exit-code -- '*.nix'; then
              echo "All Nix files are formatted correctly"
            else
              echo "Nix files need formatting. Run 'nix fmt' locally."
              exit 1
            fi
  EOF
''
