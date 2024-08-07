<h1 align="center">NixOS Dotfiles</h1>
<h3 align="center">Welcome to my NixOS Dotfiles repository! Here, you'll find my personal configuration files for NixOS, tailored to create an efficient and productive development environment.</h3>

## What's Included
- Window Manager:
> Qtile configured for Wayland.
- Shell:
> Fish shell with tmux integration.
- Font Configuration:
> A curated set of fonts including Fira Code, JetBrains Mono,  and more for a pleasant coding experience.
- Kernel:
> Using the Zen kernel for enhanced performance.
- Development Tools:
> Configurations for a variety of tools and frameworks I frequently use.
- Editor:
> Neovim setup with NixVim configuration.
- Graphics:
> Optimized settings for AMD GPU.

## Features
- Strong Qtile Configuration: 
> Customized setup for Qtile for maximum efficiency.
- Performance Tweaks:
> Settings to optimize gaming performance, including support for Gamescope.
- Eye Comfort:
> Adjustments to reduce eye strain, suitable for long coding sessions.

## Installation
To use these dotfiles, follow the instructions below:
1) Clone the repository in home directory: 
```git clone https://github.com/Gurjaka/Dotfiles.git```
2) Modify flake.nix to set Hostname and Username, in `Dotfiles/flake.nix`
3) Delete the hardware configuration in `Dotfiles/nixos/hardware-configuration.nix`
4) Copy your hardware config using this command: 
```sudo cp /etc/nixos/hardware-configuration.nix ~/Dotfiles/nixos/```
5) Rebuild your system: 
```sudo nixos-rebuild switch --flake ~/Dotfiles#HOSTNAME```