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
        alpha-nvim
        bufferline-nvim
        cmp-nvim-lsp
        cmp-path
        cmp_luasnip
        conform-nvim
        friendly-snippets
        indent-blankline-nvim
        lualine-nvim
        luasnip
        markdown-preview-nvim
        mini-clue
        mini-icons
        mini-pairs
        mini-surround
        nix-develop-nvim
        noice-nvim
        nvim-cmp
        nvim-lspconfig
        nvim-notify
        nvim-tree-lua
        nvim-web-devicons
        render-markdown-nvim
        telescope-nvim
        todo-comments-nvim
        vim-illuminate
        vim-visual-multi
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
