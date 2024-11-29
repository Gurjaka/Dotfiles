#! /usr/bin/env sh
echo "let 
  pkgs = import <nixpkgs> {};
in
pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      pip
    ]))
  ];
}" > shell.nix
