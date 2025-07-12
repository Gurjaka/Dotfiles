# ❄️ NixOS + Dotfiles Installation Guide

## 🧊 Step 0: Base NixOS Installation

To begin, install a minimal NixOS setup. Follow the official guide below:  
📚 **[NixOS Btrfs Installation Guide](https://wiki.nixos.org/wiki/Btrfs)**

Once you're done and have rebooted into your system, proceed with the steps below.

---

## 🚀 Step 1: Clone Dotfiles

```bash
git clone https://github.com/Gurjaka/Dotfiles.git ~/
```

---

## ⚙️ Step 2: Configure flake.nix

Open the file `~/Dotfiles/flake.nix` and edit the following fields:

* 🖥️ `hostname`
* 👤 `username`
* 💽 `drivers` (e.g. `nvidia`, `amd`, or `intel`)

You should also copy your system’s hardware config:

```bash
cp /etc/nixos/hardware-configuration.nix ~/Dotfiles/nixos/
```

---

## 🔄 Step 3: Apply the Config

Run the following commands to apply the system and home configurations:

```bash
# System config
sudo nixos-rebuild switch --flake ~/Dotfiles#YOUR_HOSTNAME

# Home manager config
nix run home-manager -- switch --flake ~/Dotfiles#YOUR_USERNAME
```

💡 Replace `YOUR_HOSTNAME` and `YOUR_USERNAME` accordingly.

---

## 🧼 Step 4: Vivaldi Note (If Used)

If your preferred browser is **Vivaldi**, make sure to launch it **once manually** to generate its configuration directories.

Then, re-run the home-manager switch:

```bash
nix run home-manager -- switch --flake ~/Dotfiles#YOUR_USERNAME
```

This will allow Vivaldi's preconfigured settings to be applied cleanly.

---

## 🔐 Step 5: Secrets with agenix

If you are using secrets (like API tokens, SSH keys, etc.), your dotfiles may include a `secrets/` directory managed via [agenix](https://github.com/ryantm/agenix).

---

## ✅ Step 6: Confirm Everything Works

After setup, verify the following:

* 🎨 Theme applied (Nord/Everforest)
* 🧠 Qtile working with custom bar + widgets
* 🖥️ Terminal (Kitty / Foot) themed and functional
* 🐟 Fish or Zsh shell initialized properly
* 💡 Notification daemon (`SwayNC`) running on Wayland
* 🔤 Neovim opens with correct LSPs and theme
* 🧾 Scripts and aliases available in terminal (`alias`, `l`, `hs`, etc.)

---

> ⚠️ If anything breaks, try rebuilding again. If you see missing permissions, check your user in the secrets or `flake.nix`.

Enjoy your aesthetic & powerful NixOS setup! 🌲❄️

---
