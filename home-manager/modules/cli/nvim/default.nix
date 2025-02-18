{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = builtins.readFile ./init.lua;

    plugins = with pkgs.vimPlugins; [
      alpha-nvim
      cmp-nvim-lsp
      cmp-path
      conform-nvim
      indent-blankline-nvim
      lualine-nvim
      luasnip
      friendly-snippets
      cmp_luasnip
      nix-develop-nvim
      noice-nvim
      nord-nvim
      nvim-cmp
      nvim-lspconfig
      nvim-notify
      nvim-tree-lua
      nvim-web-devicons
      render-markdown-nvim
      telescope-nvim
      # lf-vim
      # yazi-nvim
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-bash
        p.tree-sitter-c
        p.tree-sitter-cpp
        p.tree-sitter-dockerfile
        p.tree-sitter-go
        p.tree-sitter-gomod
        p.tree-sitter-html
        p.tree-sitter-json
        p.tree-sitter-lua
        p.tree-sitter-nix
        p.tree-sitter-php
        p.tree-sitter-python
        p.tree-sitter-todotxt
        p.tree-sitter-yaml
      ]))
    ];

    extraPackages = with pkgs; [
      ccls
      clang-tools
      gopls
      lua-language-server
      nixd
      pyright
      typescript-language-server
      vscode-langservers-extracted
    ];
  };
}
