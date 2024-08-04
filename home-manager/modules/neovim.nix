{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
    
    opts = {
      number = true;
      relativenumber = true;
    };

    globals.mapleader = " ";

    colorschemes.nord.enable = true;

    clipboard.register = "unnamedplus";

    keymaps = [
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fg";
      }
      {
        action = "<cmd>Telescope buffers<CR>";
        key = "<leader>fb";
      }
      {
        action = "<cmd>Telescope help_tags<CR>";
        key = "<leader>fh";
      }
      {
        action = "<cmd>NvimTreeToggle<CR>";
        key = "<leader>y";
      }
      {
        action = "<cmd>NvimTreeFocus<CR>";
        key = "<leader>t";
      }
    ];

    plugins = {
      lualine.enable = true;

      nvim-tree = {
        enable = true;
        autoReloadOnWrite = true;
        openOnSetup = true;
        extraOptions = {
          view = {
            side = "right";
          };  
        };
      };

      treesitter = {
        enable = true;
        settings = {
          defaults = {
            file_ignore_patterns = [
              "^.git/"
              "^.mypy_cache/"
              "^__pycache__/"
              "^output/"
              "^data/"
              "%.ipynb"
            ];
            layout_config = {
              prompt_position = "top";
            };
            mappings = {
              i = {
                "<A-j>" = {
                  __raw = "require('telescope.actions').move_selection_next";
                };
                "<A-k>" = {
                  __raw = "require('telescope.actions').move_selection_previous";
                };
              };
            };
            selection_caret = "> ";
            set_env = {
              COLORTERM = "truecolor";
            };
            sorting_strategy = "ascending";
          };
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = false;
        settings = {
          mapping = {
            __raw = ''
              cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
              })
            '';
          };
          snippet = {
            expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          };
          sources = [
            {
              name = "nvim_lsp";
            }
            {
              name = "luasnip";
            }
            {
              name = "path";
            }
            {
              name = "buffer";
            }
          ];
        };
      };

      cmp-ai.enable = true;

      cmp-buffer.enable = true;

      cmp-nvim-lsp.enable = true;
  
      direnv.enable = true;

      noice.enable = true;

      nix.enable = true;

      nix-develop.enable = true;

      bufferline = {
        enable = true;
        alwaysShowBufferline = true;
      };

      lsp = {
        enable = true;
        servers = {
          # pylsp.enable = true;
          # pylyzer.enable = true;
          pyright.enable = true;
          nixd.enable = true;
          html.enable = true;
          java-language-server.enable = true;
          jsonls.enable = true;
          lua-ls.enable = true;
          tsserver.enable = true;
          ccls.enable = true;
        };
        keymaps.diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
        };
        keymaps.lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };
      
      comment.enable = true;
      
      alpha = {
        enable = true;
        theme = "dashboard";
      };

      indent-blankline.enable = true;

      telescope.enable = true; 
    };
  };
}
