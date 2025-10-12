local cmp = require 'cmp'
local lspconfig = require('lspconfig')

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept selected item.
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
	}, {
			{ name = 'luasnip' },
			{ name = 'buffer' },
			{ name = 'path' },
	})
})

-- Advertise CMP capabilities to LSP servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local setup_server = function(server)
	lspconfig[server].setup({ capabilities = capabilities })
end

for _, server in ipairs({ "clangd", "gopls", "pyright", "nixd", "html", "lua_ls", "ts_ls" }) do
	setup_server(server)
end

-- Optional: Additional source-specific configuration
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- Git completions
	}, {
		{ name = 'buffer' },
	}),
})

-- Optional: Command-line completion
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
