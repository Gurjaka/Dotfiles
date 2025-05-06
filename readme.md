<div align="center">

<img alt="Nix-Snowflake" src="assets/nix-snowflake-nord.svg" width="120px"/>

# <samp>Gurjaka's Dotfiles</samp>

![GitHub Repo stars](https://img.shields.io/github/stars/Gurjaka/Dotfiles?style=for-the-badge&labelColor=2e3440&color=5e81ac) ![GitHub last commit](https://img.shields.io/github/last-commit/Gurjaka/Dotfiles?style=for-the-badge&labelColor=2e3440&color=5e81ac) ![GitHub repo size](https://img.shields.io/github/repo-size/Gurjaka/Dotfiles?style=for-the-badge&labelColor=2e3440&color=5e81ac)

#
### <samp>Welcome to my NixOS Dotfiles repository! Here, you'll find my personal configuration files for NixOS, tailored to create an efficient and productive development environment.</samp>
#
<img alt="Repository Banner" src="assets/banner.png" width="900px">
<img alt="Qtile window manager base" src="assets/qtile_base.png" width="900px">
</div>

## <samp>🔧 Installation</samp>

### ❄️  <samp>NixOS</samp>
`I` Clone the repository in home directory: 
```bash
git clone https://github.com/Gurjaka/Dotfiles.git ~/
```

`II` Modify flake.nix to set Hostname, Username, and Drivers in `~/Dotfiles/flake.nix`

> Note: Don't forget to edit the appropriate settings such as username & hardware configuration
> You can use `cp /etc/nixos/hardware-configuration.nix ~/Dotfiles/nixos/`

`III` Rebuild your system (Change HOSTNAME): 
```bash
sudo nixos-rebuild switch --flake ~/Dotfiles#HOSTNAME
```
> Note: If your browser of choice is Vivaldi, you need to open Vivaldi atleast once to generate it's settings, and rebuild afterwards in order to apply preconfigured settings

## 📑 <samp>DETAILS</samp>

### <samp>🛠️ System</samp>
<img alt="Qtile floatting" src="assets/qtile_floating.png" width="400px" align="right"/>

- Linux Kernel: [Zen](https://github.com/zen-kernel/zen-kernel)
- Desktop Environment: [Qtile](http://www.qtile.org)
- Terminal Emulator: [Foot](https://codeberg.org/dnkl/foot) and [Kitty](https://sw.kovidgoyal.net/kitty/)
- Shell: [Fish](https://fishshell.com/) and [Zsh](https://www.zsh.org/)
- Compositor: [Qtile Wayland](https://docs.qtile.org/en/stable/manual/wayland.html)
- Notifier: [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)

### <samp>Dev</samp>
<img alt="Qtile floatting" src="assets/qtile_floating2.png" width="400px" align="right"/>

- Browser: [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- GUI Text Editor: [VSCode](https://code.visualstudio.com/)
- TUI Text Editor: [Neovim](https://neovim.io/)
- TUI Commit Helper: [Lazygit](https://github.com/jesseduffield/lazygit)

### <samp>Other Utilities</samp>

- TUI File manager: [Yazi](https://yazi-rs.github.io/)
- GUI File manager: [Thunar](https://docs.xfce.org/xfce/thunar/start)
- Resource monitor: [Btop](https://github.com/aristocratos/btop)
- screenshot tool: [Flameshot](https://flameshot.org)

<img alt="Qtile tilling" src="assets/qtile_tiling.png" width="400px" align="right"/>

## 🎨 <samp>Colors</samp>

<table align="right">
  <tr>
    <td align="center">
      <samp>
        This color scheme is inspired from
        <a href="https://www.nordtheme.com/">Nord</a>
      </samp>
    </td>
  </tr>
</table>


<p align="center">
  <a href="https://www.nordtheme.com/docs/colors-and-palettes" target="_blank">
    <picture>
      <source srcset="https://raw.githubusercontent.com/nordtheme/assets/main/static/images/artworks/coloring/cards.svg?sanitize=true" width="100%" alt="Nord color palette cards" media="(prefers-color-scheme: dark), (prefers-color-scheme: no-preference)" />
    <img src="https://raw.githubusercontent.com/nordtheme/assets/main/static/images/artworks/coloring/cards.svg?sanitize=true" width="100%" alt="Nord color palette cards" />
    </picture>
  </a>
</p>

<p align="center">
  <a href="https://www.nordtheme.com/ports" target="_blank">
    <picture>
      <source srcset="https://raw.githubusercontent.com/nordtheme/assets/main/static/images/artworks/ports/nordify.svg?sanitize=true" width="100%" alt="Nord port project illustration" media="(prefers-color-scheme: light), (prefers-color-scheme: no-preference)" />
    <img src="https://raw.githubusercontent.com/nordtheme/assets/main/static/images/artworks/ports/nordify.svg?sanitize=true" width="100%" alt="Nord port project illustration" />
    </picture>
  </a>
</p>

<p align="center">
  <picture>
    <source srcset="https://raw.githubusercontent.com/nordtheme/assets/main/static/images/elements/separators/iceberg/footer/dark/spaced.svg?sanitize=true" width="100%" media="(prefers-color-scheme: light), (prefers-color-scheme: no-preference)" />
    <source srcset="https://raw.githubusercontent.com/nordtheme/assets/main/static/images/elements/separators/iceberg/footer/light/spaced.svg?sanitize=true" width="100%" media="(prefers-color-scheme: dark)" />
    <img src="https://raw.githubusercontent.com/nordtheme/assets/main/static/images/elements/separators/iceberg/footer/dark/spaced.svg?sanitize=true" width="100%" />
  </picture>
</p>
