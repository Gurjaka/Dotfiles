require 'nvim-treesitter.configs'.setup {
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

    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
}
