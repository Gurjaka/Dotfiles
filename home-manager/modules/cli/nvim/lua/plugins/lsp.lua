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
	clangd = {},
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
	ccls = {},
	zls = {}
}

for server, config in pairs(servers) do
	if lspconfig[server] then
		lspconfig[server].setup(vim.tbl_extend('force', {
			capabilities = capabilities
		}, config))
	else
		vim.notify("LSP '" .. server .. "' not found in lspconfig", vim.log.levels.WARN)
	end
end


-- Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
	end
})
