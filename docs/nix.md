# Nix & Flakes ⚙️❄️✨

My entire system and user environment are declaratively managed with **Nix** — the ultimate package manager and build system that brings reproducibility, reliability, and insane flexibility. 🔥🛠️💻

---

## 🔥 Why Nix? 🚀

* **Declarative Configuration** 📜✍️
  Everything is described in code — from system services 🖥️ to user apps 📦 — so I can rebuild my entire setup effortlessly or roll back changes ⏪ in seconds.

* **Reproducibility & Portability** 🌍✈️
  The exact same environment can be replicated on any Nix-enabled machine, making setups consistent and hassle-free. 🔄💡

* **Powerful Package Management** 📦💥
  Nix isolates dependencies, allowing multiple versions of the same app or library 📚 without conflicts — goodbye “dependency hell” 🔥😵‍💫.

---

## 🛠️ Flake-Based Setup ❄️🔗

I use **Nix flakes**, the modern way to manage Nix projects, bringing:

* Immutable, version-controlled configurations 🔒📝
* Easy integration with GitHub and other sources 🌐🐙
* Simplified sharing and updating of modules ⚙️🔄

My `flake.nix` ties everything together: system config, home-manager modules 🏡, dotfiles syncing 🔄, and even custom scripts 🤖.

---

## ⚙️ Home Manager Integration 🏡✨

Managing user-specific config (shell 🐚, editor ✍️, terminal 🖥️, etc.) declaratively with [Home Manager](https://nix-community.github.io/home-manager/) lets me keep:

* Shell configs like Fish 🐠 and Zsh 🦦
* Neovim setup and plugins 🎨🎯
* Terminal and prompt settings 🖥️⚡
* Handy scripts and aliases 🧰📝

---

## 📚 What I Love About Nix 💖

* 💪 Atomic upgrades & rollbacks — no more “it broke after update.” 🔧🛡️
* 🔄 Effortless multi-machine syncing with git + flakes 🖥️💻📱
* 🎯 Precise control over software versions and dependencies 🔍📦
* 🚀 Seamless integration with systemd, Wayland, and Wayland-native tools 🎉🖼️

---

## TL;DR ⚡

> Nix is the backbone 🦴 of my environment — powering a reproducible, flexible, and fully declarative setup that evolves with me. 🌱🔥

---
