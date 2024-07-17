{inputs, config, pkgs, lib, ...}:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;

    globals.mapleader = " ";

    colorschemes.nord.enable = true;

    clipboard.providers.wl-copy.enable = true;

    keymaps = [
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>f";
      }
      {
        action = "<cmd>Neotree toggle right<CR>";
        key = "<leader>y";
      }
      {
        action = "<cmd>Neotree<CR>";
        key = "<leader>t";
      }
    ];

    plugins = {
      lualine.enable = true;
        
      neo-tree.enable = true;

      lsp = {
        enable = true;
        servers = {
          pylsp.enable = true;
          html.enable = true;
          java-language-server.enable = true;
          jsonls.enable = true;
          lua-ls.enable = true;
          tsserver.enable = true;
          ccls.enable = true;
        };
      };

      telescope.enable = true;

      virt-column.enable = true;
    };
  };
}