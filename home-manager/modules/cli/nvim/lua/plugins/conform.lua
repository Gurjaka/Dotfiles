require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "alejandra" },
		python = { "ruff", "ruff_format" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		go = { "gofmt" },
		javascript = { { "prettierd", "prettier" } },
		html = { "prettier" },
	},
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
})
