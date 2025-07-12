# Neovim Setup ✨🎯📝

Welcome to the heart of my terminal editing workflow — Neovim, fully pimped and optimized for speed, clarity, and power. 🚀🖥️⚡

---

## 🛠️ Core Configuration 🔧

* **Enabled via Nix** 🐧: Neovim is managed declaratively through Nix, ensuring reproducibility and ease of updates.
* **Aliases & Defaults** 🔄: `nvim` is set as the default editor, with aliases for `vi`, `vim`, and `vimdiff` for convenience.
* **Lua-powered** 🐍: The entire config is Lua-based, stored in `~/Dotfiles/home-manager/modules/cli/nvim/lua` for modularity and performance.

---

## 🎨 Theme & Appearance 🌈

* **Nord & Everforest** ❄️🌲: I blend the calm, cool Nord colorscheme with the cozy, organic Everforest palette.
* **Custom Settings** ⚙️:

  * `g:nord_contrast = true` 🔳 — enhanced contrast for better readability
  * `g:nord_borders = false` 🚫 — minimal borders for clean UI
  * `g:nord_disable_background = false` 🖼️ — keep the background
  * `g:nord_italic = false` 🚫 — no italics to avoid distractions
  * `g:nord_uniform_diff_background = true` 🎨 — consistent diff backgrounds
  * `g:nord_bold = false` ✖️ — subtle bold text

---

## 🔌 Plugins & Features ⚡✨

I use a curated set of plugins to supercharge coding and navigation:

### Completion & Snippets 🤖💡

* `nvim-cmp` & `cmp-nvim-lsp` for smart autocompletion
* `luasnip` + `friendly-snippets` for powerful snippet support

### UI Enhancements 🌟🖥️

* `alpha-nvim` — Custom startup dashboard 🚪
* `lualine-nvim` — Fancy statusline with useful info 📊
* `indent-blankline-nvim` — Visually clean indentation guides ↪️
* `nvim-notify` — Notification system 🔔

### Navigation & Search 🔍🚀

* `telescope-nvim` — Fuzzy finder powerhouse 🔭
* `nvim-tree-lua` — File explorer 📁
* `vim-visual-multi` — Multi-cursor editing ✍️

### Code & Language Support 🧑‍💻💻

* `nvim-lspconfig` for LSP setup supporting multiple languages 🌐
* Language servers like `ccls`, `clang-tools`, `gopls`, `pyright`, `lua-language-server`, `typescript-language-server`, and more installed as extra packages 📦
* Treesitter parsers for Bash, C, C++, Go, Lua, Python, PHP, JSON, YAML, and others for syntax highlighting and code awareness 🌳

### Quality of Life 🧹🛠️

* `conform-nvim` — formatting support 🧼
* `nix-develop-nvim` — handy Nix development integration 🐧
* `noice-nvim` — enhanced command-line UI 💬
* `render-markdown-nvim` & `markdown-preview-nvim` for Markdown editing 📝

---

## 🏗️ Extra Packages 📦

The config extends Neovim’s power with language servers and tools installed at the system level, providing:

* Robust language support for C, Go, Lua, Python, TypeScript, and more 🛠️
* Linters like `ruff` for Python 🐍
* Tools like `nixd` for Nix language support ❄️

---

## Why This Setup? 🤔💡

* **Reproducible & Portable** 🌍: Configured declaratively through Nix to keep your setup consistent across machines.
* **Performance Focused** ⚡: Lua-based config with minimal overhead, optimized for smooth operation.
* **Balanced Look & Feel** 🎨: Clean, distraction-free UI with powerful features always within reach.
* **Developer Productivity** 🚀: All your essential tools and workflows integrated seamlessly.

---

Ready to dive deeper? 🔥 Check out the `lua` directory for all the juicy config details! 🐍⚡

---
