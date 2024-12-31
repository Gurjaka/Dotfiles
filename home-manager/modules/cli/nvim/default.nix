{
  pkgs,
  ...
}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = builtins.readFile ./init.lua;

    plugins = with pkgs.vimPlugins; [
      nord-nvim
      headlines-nvim
      bufferline-nvim
      telescope-nvim
      lualine-nvim
      nvim-web-devicons
      nix-develop-nvim
      noice-nvim
      nvim-notify
      alpha-nvim
      indent-blankline-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-path
      nvim-tree-lua
      nvim-lspconfig
      conform-nvim
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
      nixd
      clang-tools
      gopls
      pyright
      vscode-langservers-extracted
      lua-language-server
      typescript-language-server
      ccls
    ];
  };
}
