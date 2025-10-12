local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok and cmp_nvim_lsp.default_capabilities then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
elseif cmp_ok and cmp_nvim_lsp.update_capabilities then
	capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

-- Servers
local servers = {
	clangd = {
			cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
			filetypes = { "c", "cpp", "objc", "objcpp" },
			capabilities = capabilities,
	},
	gopls = {},
	pyright = {},
	nixd = {
		settings = {
			nixd = {
				formatting = { command = { "alejandra" } },
				nixpkgs = { expr = "import <nixpkgs> { }" }
			}
		}
	},
	html = {},
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = {
						"vim",
						"require"
					},
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
	ts_ls = {},
	zls = {}
}

-- Setup LSP servers
for name, config in pairs(servers) do
    if lspconfig[name] then
        lspconfig[name].setup(config)
    else
        vim.notify("LSP '" .. name .. "' not found in lspconfig", vim.log.levels.WARN)
    end
end

-- Diagnostics display
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
})

-- Keymaps on LSP attach
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        local map = vim.keymap.set
        -- Navigation
        map('n', 'gd', vim.lsp.buf.definition, opts)
        map('n', 'gr', vim.lsp.buf.references, opts)
        map('n', 'K', vim.lsp.buf.hover, opts)
        -- Actions
        map('n', '<leader>rn', vim.lsp.buf.rename, opts)
        map({'n','v'}, '<leader>ca', vim.lsp.buf.code_action, opts)
        map('n', '<leader>f', vim.lsp.buf.format, opts)
        map('n', '<leader>ds', vim.lsp.buf.document_symbol, opts)
    end
})
