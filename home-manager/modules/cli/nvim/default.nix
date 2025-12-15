{
  lib,
  pkgs,
  selectedTheme,
  themes,
  ...
}: {
  home.file = {
    nvim_conf = {
      source = ./lua;
      target = ".config/nvim/lua";
      recursive = true;
    };
    nvim_table = {
      text = ''
        local themes = {
            ${builtins.concatStringsSep ",\n    "
          (lib.mapAttrsToList
            (name: theme: "${name} = { nvim_name = \"${theme.nvim.name}\" }")
            themes)}
        }
      '';
      target = ".config/nvim/lua/core/theme_table.lua";
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = builtins.readFile ./init.lua;
    extraConfig = ''
      ${builtins.concatStringsSep "\n" (map (theme: theme.nvim.settings) (builtins.attrValues themes))}
      colorscheme ${selectedTheme.nvim.name}
    '';

    plugins = with pkgs.vimPlugins;
      (builtins.map (theme: theme.nvim.package) (builtins.attrValues themes))
      ++ [
        # UI plugins
        alpha-nvim
        bufferline-nvim
        lualine-nvim
        mini-icons
        nvim-tree-lua
        nvim-web-devicons

        # LSP and completion
        cmp-nvim-lsp
        cmp-path
        cmp_luasnip
        friendly-snippets
        luasnip
        nvim-cmp
        nvim-lspconfig

        # Editing enhancements
        conform-nvim
        gitsigns-nvim
        indent-blankline-nvim
        mini-clue
        mini-pairs
        mini-surround
        vim-illuminate
        vim-visual-multi

        # Notes and Markdown
        markdown-preview-nvim
        render-markdown-nvim
        todo-comments-nvim

        # Navigation and search
        telescope-nvim

        # NixOS specific
        nix-develop-nvim

        # Other utilities
        noice-nvim
        yazi-nvim

        (nvim-treesitter.withPlugins (p:
          with p; [
            tree-sitter-bash
            tree-sitter-c
            tree-sitter-cpp
            tree-sitter-dockerfile
            tree-sitter-go
            tree-sitter-gomod
            tree-sitter-html
            tree-sitter-json
            tree-sitter-lua
            tree-sitter-markdown
            tree-sitter-markdown-inline
            tree-sitter-nix
            tree-sitter-php
            tree-sitter-python
            tree-sitter-todotxt
            tree-sitter-yaml
            tree-sitter-zig
          ]))
        nvim-treesitter-context
      ];

    extraPackages = with pkgs; [
      clang-tools
      gopls
      lua-language-server
      nixd
      pyright
      ruff
      typescript-language-server
      vscode-langservers-extracted
      zls
    ];
  };
}
