<div align="center">

<h1>Gurjaka's Dotfiles 🧩✨</h1>

<img alt="TBC-Logo" src="assets/banner.png" />
<br><br>
<strong>Welcome to my personal dotfiles repository!</strong>
<br><br>
Here you’ll find my <strong>minimal</strong>, <strong>suckless</strong>, and <strong>Wayland-first</strong> configuration for <strong>NixOS</strong> and daily dev tools — carefully crafted to boost <strong>productivity</strong> <strong>speed</strong>, and <strong>maintainability</strong> 🚀💻

</div>

---

## ⚙️ System Overview 🖥️🔧

![qtile base](./assets/qtile_base.png) 

This setup is built to be **modern**, **efficient**, and **elegant**, with a focus on **keyboard-driven workflows** and **reproducible environments**:

- **Linux Kernel** 🐧  
  Powered by the [Zen kernel](https://github.com/zen-kernel/zen-kernel), optimized for _desktop responsiveness_, _gaming performance_, and _low latency_. It’s the core that keeps everything running **smooth and fast**.

- **Window Manager** 🪟🎛️  
  Using [Qtile](http://www.qtile.org) with an experimental Wayland backend. Qtile is a **dynamic tiling window manager written in Python**, designed for total keyboard control and customization. The Wayland backend delivers modern, secure, and smooth graphical performance.

- **Terminal Emulators** 🖱️⌨️  
  - [`Foot`](https://codeberg.org/dnkl/foot): A Wayland-native, minimal terminal emulator with great performance.  
  - [`Kitty`](https://sw.kovidgoyal.net/kitty/): GPU-accelerated, feature-rich terminal for daily use.

- **Shells** 🐚  
  I primarily use [`Fish`](https://fishshell.com/) for its user-friendly features and smart completions, alongside [`Zsh`](https://www.zsh.org/) for compatibility and scripting power.

- **Notifier** 🔔  
  [`SwayNC`](https://github.com/ErikReider/SwayNotificationCenter) handles notifications seamlessly within the Wayland ecosystem, keeping distractions minimal and information clear.

---

## 💻 Development Tools Overview 🔨🛠️

![qtile floating](assets/qtile_floating.png) 

The environment is designed for **fast**, **distraction-free coding** and system management:

- **Browser** 🌐  
  [`Firefox`](https://www.firefox.com/en-US/) — a privacy-focused, open-source browser that respects user freedom.

- **Editors** ✍️  
  - GUI: [`VSCode`](https://code.visualstudio.com/) for heavy lifting and GUI convenience.  
  - Terminal: [`Neovim`](https://neovim.io/) with custom plugin setups, LSP integration, and thematic consistency for an efficient terminal editing experience.

- **Git Helper** 🔄  
  [`Lazygit`](https://github.com/jesseduffield/lazygit) offers a fast, intuitive interface for managing Git workflows right in your terminal.

- **File Managers** 📁  
  - Terminal: [`Yazi`](https://yazi-rs.github.io/) for quick file navigation without leaving the keyboard.  
  - GUI: [`Thunar`](https://docs.xfce.org/xfce/thunar/start) for graphical file operations when needed.

- **System Monitor** 📊  
  [`Btop`](https://github.com/aristocratos/btop) provides an interactive and visually appealing resource monitor.

- **Screenshot Tool** 📸  
  [`Flameshot`](https://flameshot.org) for customizable screenshots with ease.

---

## 🎨 Theme & Philosophy 🎭🌈

This dotfiles collection is a harmonious blend of aesthetics and function:

> Visual style inspired by the ❄️ [Nord](https://www.nordtheme.com/) theme’s icy calmness combined with the 🌲 [Everforest](https://github.com/sainnhe/everforest) palette’s warm, organic tones — creating a balanced and visually comfortable workspace.

**Core values:**

- **Simplicity** 🧹  
  Every line of config has a purpose — no unnecessary fluff or bloat.

- **Speed** ⚡  
  Fast startup times, snappy interactions, and smooth workflows to keep you in the zone.

- **Maintainability** 🛡️  
  Modular, declarative, and reproducible with the power of Nix and Home Manager.

- **Wayland-first** 🚀  
  Embracing the future of Linux display protocols for improved security, performance, and flexibility.

---

<table align="center">
  <tr>
    <td align="center">
      <samp>
        This configuration blends the <a href="https://www.nordtheme.com/">❄️ Nord</a>
        theme's icy calmness with the earthy tones of <a href="https://github.com/sainnhe/everforest">🌲 Everforest</a>.
      </samp>
    </td>
  </tr>
</table>

<div align="center">
  <table>
    <tr>
      <td align="center">
        <a href="https://www.nordtheme.com/docs/colors-and-palettes" target="_blank">
          <img src="https://raw.githubusercontent.com/nordtheme/assets/main/static/images/artworks/coloring/cards.svg?sanitize=true" width="400px" alt="Nord color palette cards"/>
        </a>
        <p><samp>Nord Palette</samp></p>
      </td>
      <td align="center">
      <br><br><br><br>
        <a href="https://github.com/sainnhe/everforest" target="_blank">
          <img src="https://user-images.githubusercontent.com/58662350/214382352-cd7a4f63-e6ef-4575-82c0-a8b72aa37c0c.png" width="400px" alt="Everforest color palette"/>
        </a>
        <p><samp>Everforest Palette</samp></p>
      </td>
    </tr>
  </table>
</div>

<p align="center">
  <picture>
    <source srcset="https://raw.githubusercontent.com/nordtheme/assets/main/static/images/elements/separators/iceberg/footer/dark/spaced.svg?sanitize=true" width="100%" media="(prefers-color-scheme: light), (prefers-color-scheme: no-preference)" />
    <source srcset="https://raw.githubusercontent.com/nordtheme/assets/main/static/images/elements/separators/iceberg/footer/light/spaced.svg?sanitize=true" width="100%" media="(prefers-color-scheme: dark)" />
    <img src="https://raw.githubusercontent.com/nordtheme/assets/main/static/images/elements/separators/iceberg/footer/dark/spaced.svg?sanitize=true" width="100%" />
  </picture>
</p>

---

## 🚀 What’s Next?

Dive into the sections to explore:

- 🪟 Qtile config and customizations  
- ✍️ Neovim setup, plugins, and LSP details  
- 🖥️ Terminal and shell environment configs  
- 📦 Nix flakes, home-manager modules, and reproducibility  
- 🛠️ Utilities, scripts, and workflow tips

---

*— Gurami Esartia ✌️*
