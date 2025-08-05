{
  pkgs,
  colorscheme,
  ...
}: {
  home.file = {
    nvim_conf = {
      source = ./lua;
      target = ".config/nvim/lua";
      recursive = true;
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
      let g:nord_contrast = v:true
      let g:nord_borders = v:false
      let g:nord_disable_background = v:false
      let g:nord_italic = v:false
      let g:nord_uniform_diff_background = v:true
      let g:nord_bold = v:false

      colorscheme ${colorscheme}
    '';

    plugins = with pkgs.vimPlugins; [
      alpha-nvim
      cmp-nvim-lsp
      cmp-path
      everforest
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
      # nvim-tree-lua
      yazi-nvim
      kanagawa-nvim
      nvim-surround
      nvim-web-devicons
      render-markdown-nvim
      vim-visual-multi
      telescope-nvim
      markdown-preview-nvim
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
          tree-sitter-nix
          tree-sitter-php
          tree-sitter-python
          tree-sitter-todotxt
          tree-sitter-yaml
        ]))
    ];

    extraPackages = with pkgs; [
      ccls
      clang-tools
      gopls
      lua-language-server
      nixd
      pyright
      ruff
      typescript-language-server
      vscode-langservers-extracted
    ];
  };
}
