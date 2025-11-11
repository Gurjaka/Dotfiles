require 'nvim-treesitter.configs'.setup {
  sync_install = false,
  modules = {},
  -- Parsers are installed externally via Nix
  ensure_installed = {},

  -- Do not auto-install missing parsers
  auto_install = false,
  ignore_install = {},

  highlight = {
    enable = true,
    disable = { "nix", "html" },
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      node_decremental = "grm",
      scope_incremental = "grc",
    },
  },

  indent = { enable = true },
  fold = { enable = false }, -- optional; leave off if you don’t like code folding

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ap"] = "@parameter.outer",
        ["ip"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = { ["]m"] = "@function.outer" },
      goto_previous_start = { ["[m"] = "@function.outer" },
    },
  },
}

require('treesitter-context').setup {
  enable = true,
  max_lines = 4,
  trim_scope = 'outer',
}
