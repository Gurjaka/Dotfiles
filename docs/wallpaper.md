# 🎨 Wallpaper Integration ✨🖼️

My dotfiles include seamless support for both **🌌 Nord** and **🌲 Everforest** wallpapers, dynamically managed through Nix flakes and tightly coupled with the current color scheme. Beautiful wallpapers, automatically in sync with your system theme. 🌈🚀

---

## 📦 Flake Inputs 🧊🌿

Both wallpaper collections are added as inputs in `flake.nix`:

```nix
{
  inputs = {
    nord-wallpapers = {
      url = "github:Gurjaka/Nord-Wallpapers";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    everforest-wallpapers = {
      url = "github:Gurjaka/Everforest-Wallpapers";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

---

## 🏡 Home Manager Integration 🔗📂

In `home-manager/modules/theme/wallpapers.nix`, the contents of each repo are symlinked into `~/.config/wallpapers/`:

```nix
{ inputs, pkgs, ... }:

{
  home.file = {
    ".config/wallpapers/nord/" = {
      source = inputs.nord-wallpapers.packages."${pkgs.system}".default;
      recursive = true;
    };
    ".config/wallpapers/everforest/" = {
      source = inputs.everforest-wallpapers.packages."${pkgs.system}".default;
      recursive = true;
    };
  };
}
```

📁 This setup ensures all wallpapers are in one tidy location based on theme. 🧼✨

---

## 🔁 Dynamic Wallpaper Switching (`wallrandom`) 🎲🖼️

A custom script called `wallrandom` randomly picks a wallpaper based on the current theme, then applies it using [`swww`](https://github.com/LGFae/swww) with a beautiful animated transition. 🌠

Defined in `wallrandom.nix`:

```nix
{ pkgs }:

pkgs.writeShellScriptBin "wallrandom" ''
  set -e

  FLAKE=$HOME/Dotfiles/flake.nix
  FLAKE_DIR=$HOME/Dotfiles

  # Detect current theme from flake.nix
  current=$(grep 'colorscheme = "' "$FLAKE" | sed -E 's/.*"([^"]+)".*/\1/')

  DIR=$HOME/.config/wallpapers/$current
  PICS=($(ls ''${DIR}))
  RANDOMPICS=''${PICS[ $RANDOM % ''${#PICS[@]} ]}

  swww query || swww-daemon

  swww img ''${DIR}/''${RANDOMPICS} \
    --transition-fps 165 \
    --transition-type grow \
    --transition-pos 0.2,0.2 \
    --transition-duration 1
''
```

🔍 This script:

* 🔎 Detects your current `colorscheme` from the flake
* 🎲 Picks a random wallpaper from the theme-matched folder
* 🌄 Applies it with a smooth `swww` transition

---

## 🧪 Usage 💻⚡

Once `wallrandom` is in your `$PATH`, just run:

```bash
wallrandom
```

💡 **Pro Tip**: Bind this to a keyboard shortcut in your WM for instant wallpaper shuffle magic. 🧙

---

## 📚 Related Repositories

* 🌌 [Nord Wallpapers](https://github.com/Gurjaka/Nord-Wallpapers) — minimal & icy
* 🌲 [Everforest Wallpapers](https://github.com/Gurjaka/Everforest-Wallpapers) — warm & cozy

These collections are handcrafted and curated with aesthetics and compatibility in mind. 🎨🧘‍♂️

---
