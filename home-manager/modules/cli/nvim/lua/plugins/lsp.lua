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
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--completion-style=detailed",
      "--header-insertion=never",
      "--offset-encoding=utf-16",  -- avoids UTF offset issues
    },
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

-- Keymaps on LSP attach
local function on_attach(client, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  map('n', 'gd', vim.lsp.buf.definition, "Go to definition")
  map('n', 'gr', vim.lsp.buf.references, "References")
  map('n', 'K', vim.lsp.buf.hover, "Hover docs")
  map('n', '<leader>rn', vim.lsp.buf.rename, "Rename symbol")
  map({'n','v'}, '<leader>ca', vim.lsp.buf.code_action, "Code action")
  map('n', '<leader>f', function()
    vim.lsp.buf.format({ async = true })
  end, "Format buffer")

  -- Example: disable formatting for LSPs that conflict with conform
  if client.name == "ts_ls" or client.name == "html" then
    client.server_capabilities.documentFormattingProvider = false
  end
end

-- Setup LSP servers
for name, config in pairs(servers) do
  if lspconfig[name] then
    config.capabilities = config.capabilities or capabilities
    config.on_attach = config.on_attach or on_attach
    lspconfig[name].setup(config)
  else
    vim.notify("LSP '" .. name .. "' not found in lspconfig", vim.log.levels.WARN)
  end
end

-- Diagnostics display
vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "●" },
  float = { border = "rounded" },
  severity_sort = true,
  update_in_insert = false,
})
