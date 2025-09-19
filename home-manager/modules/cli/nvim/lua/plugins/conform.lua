require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "alejandra" },
		python = { "ruff", "ruff_format" },
		go = { "gofmt" },
		javascript = { "prettierd", "prettier" },
		html = { "prettier" },
		zig = { "zigfmt" },
	},
	format_on_save = {
		lsp_fallback = false,
		timeout_ms = 500,
	},
	stop_after_first = true,
})
