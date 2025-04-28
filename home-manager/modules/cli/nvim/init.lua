-- General vim settings
--
-- User interface
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.scrolloff = 8     -- Keep 8 lines above/below cursor when scrolling
vim.o.sidescrolloff = 8 -- Keep 8 columns left/right of cursor
vim.o.list = true       -- Show invisible characters
vim.o.listchars = "tab:→ ,trail:·,extends:↷,precedes:↶"
--
-- Editor behavior
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "python" },
	command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab"
})
vim.o.clipboard = "unnamedplus"
vim.o.swapfile = false
vim.o.autoread = true -- Auto-reload files changed outside vim
--
-- Search settings
vim.o.ignorecase = true -- Case-insensitive search
vim.o.smartcase = true  -- Case-sensitive if uppercase present
vim.o.incsearch = true  -- Show matches while typing
--
-- Performance optimizations
vim.loader.enable()       -- Neovim 0.9+ bytecode cache
vim.g.do_filetype_lua = 1 -- Faster filetype detection
vim.o.updatetime = 250    -- Faster CursorHold events, better UX
vim.o.timeoutlen = 300    -- Quicker timeout for mapped sequences
--
-- Font & appearance
vim.g.have_nerd_font = true

-- Nord colorscheme
vim.g.nord_contrast = false
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_enable_sidebar_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true

-- Load the colorscheme
require("nord").set()

-- Telescope configuration
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope recent files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Load web devicons
require 'nvim-web-devicons'.get_icons()

-- Lua line config
local colors = {
	blue        = '#81a1c1',
	frost_green = '#8fbcbb',
	black       = '#2e3440',
	white       = '#eceff4',
	red         = '#bf616a',
	violet      = '#b48ead',
	grey        = '#3b4252',
}

local nord_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.blue },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white, bg = colors.black },
	},

	insert = { a = { fg = colors.black, bg = colors.white } },
	visual = { a = { fg = colors.black, bg = colors.frost_green } },
	replace = { a = { fg = colors.black, bg = colors.violet } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white },
	},
}

require('lualine').setup {
	options = {
		theme = nord_theme,
		component_separators = '',
		section_separators = { left = '', right = '' },
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = true,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		}
	},
	sections = {
		lualine_a = { { 'mode', separator = { left = '' }, right_padding = 1 } },
		lualine_b = { 'branch', 'filetype' },
		lualine_c = { 'filename' },
		lualine_x = { 'diff', 'diagnostics' },
		lualine_y = { 'progress' },
		lualine_z = {
			{ 'location', separator = { right = '' }, left_padding = 1 },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
}

-- Nvim-tree configuration
-- require("nvim-tree").setup({
-- 	auto_reload_on_write = true,
--
-- 	sort = {
-- 		sorter = "case_sensitive",
-- 	},
-- 	view = {
-- 		width = 30,
-- 		side = "right",
-- 	},
-- 	renderer = {
-- 		group_empty = true,
-- 	},
-- 	filters = {
-- 		dotfiles = true,
-- 	},
-- })
--
-- vim.keymap.set('n', '<leader>t', ':NvimTreeFocus<CR>')

-- Lf-vim configuration
vim.g.lf_map_keys = 0
vim.keymap.set('n', '<leader>t', ':Lf<CR>')

-- Treesitter configuration
require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = {},

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,

	-- List of parsers to ignore installing (or "all")
	ignore_install = {},

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,
		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		disable = { "nix", "html" },
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}

-- Lsp configuration
local lspcfg = require('lspconfig')
lspcfg.clangd.setup({})
lspcfg.gopls.setup({})
lspcfg.pyright.setup({})
lspcfg.nixd.setup({
	cmd = { "nixd" },
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			formatting = {
				command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
			},
		},
	},
})
lspcfg.html.setup({})
lspcfg.lua_ls.setup({})
lspcfg.ts_ls.setup({})
lspcfg.ccls.setup({})
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }

		vim.keymap.set('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.run, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
	end,
})

require('lspconfig.ui.windows').default_options.border = 'rounded'

-- Noice configuration
require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true,   -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false,     -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})

-- Notify configuration
require("notify").setup({
	render = "minimal",
	stages = "static",
})

-- Load Alpha
require("alpha").setup(require 'alpha.themes.dashboard'.config)

-- Load Indent Blank Line
require("ibl").setup()

-- CMP Configuration
local cmp = require 'cmp'

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
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
	}),
})

-- Advertise CMP capabilities to LSP servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configure an LSP server (e.g., clangd) with CMP capabilities
require('lspconfig').clangd.setup {
	capabilities = capabilities,
}

local setup_server = function(server)
	lspcfg[server].setup({ capabilities = capabilities })
end

for _, server in ipairs({ "clangd", "gopls", "pyright", "nixd", "html", "lua_ls", "ts_ls", "ccls" }) do
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

-- Conform Configuration
require("conform").setup({
	formatters_by_ft = {
		clang = { "clang-format" },
		go = { "gofmt" },
		html = { "prettier" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		lua = { "stylua" },
		nix = { "alejandra" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		typescript = { "prettier" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})

-- Markdown nvim configuration
require('render-markdown').setup({
	-- Whether Markdown should be rendered by default or not
	enabled = true,
	-- Vim modes that will show a rendered view of the markdown file, :h mode(), for
	-- all enabled components. Individual components can be enabled for other modes.
	-- Remaining modes will be unaffected by this plugin.
	render_modes = { 'n', 'c', 't' },
	-- Maximum file size (in MB) that this plugin will attempt to render
	-- Any file larger than this will effectively be ignored
	max_file_size = 10.0,
	-- Milliseconds that must pass before updating marks, updates occur
	-- within the context of the visible window, not the entire buffer
	debounce = 100,
	-- Pre configured settings that will attempt to mimic various target
	-- user experiences. Any user provided settings will take precedence.
	--  obsidian: mimic Obsidian UI
	--  lazy:     will attempt to stay up to date with LazyVim configuration
	--  none:     does nothing
	preset = 'none',
	-- The level of logs to write to file: vim.fn.stdpath('state') .. '/render-markdown.log'
	-- Only intended to be used for plugin development / debugging
	log_level = 'error',
	-- Print runtime of main update method
	-- Only intended to be used for plugin development / debugging
	log_runtime = false,
	-- Filetypes this plugin will run on
	file_types = { 'markdown' },
	-- Out of the box language injections for known filetypes that allow markdown to be
	-- interpreted in specified locations, see :h treesitter-language-injections
	-- Set enabled to false in order to disable
	injections = {
		gitcommit = {
			enabled = true,
			query = [[
                ((message) @injection.content
                    (#set! injection.combined)
                    (#set! injection.include-children)
                    (#set! injection.language "markdown"))
            ]],
		},
	},
	anti_conceal = {
		-- This enables hiding any added text on the line the cursor is on
		enabled = true,
		-- Which elements to always show, ignoring anti conceal behavior. Values can either be booleans
		-- to fix the behavior or string lists representing modes where anti conceal behavior will be
		-- ignored. Possible keys are:
		--  head_icon, head_background, head_border, code_language, code_background, code_border
		--  dash, bullet, check_icon, check_scope, quote, table_border, callout, link, sign
		ignore = {
			code_background = true,
			sign = true,
		},
		-- Number of lines above cursor to show
		above = 0,
		-- Number of lines below cursor to show
		below = 0,
	},
	padding = {
		-- Highlight to use when adding whitespace, should match background
		highlight = 'Normal',
	},
	latex = {
		-- Whether LaTeX should be rendered, mainly used for health check
		enabled = true,
		-- Additional modes to render LaTeX
		render_modes = false,
		-- Executable used to convert latex formula to rendered unicode
		converter = 'latex2text',
		-- Highlight for LaTeX blocks
		highlight = 'RenderMarkdownMath',
		-- Amount of empty lines above LaTeX blocks
		top_pad = 0,
		-- Amount of empty lines below LaTeX blocks
		bottom_pad = 0,
	},
	on = {
		-- Called when plugin initially attaches to a buffer
		attach = function() end,
		-- Called after plugin renders a buffer
		render = function() end,
	},
	heading = {
		-- Turn on / off heading icon & background rendering
		enabled = true,
		-- Additional modes to render headings
		render_modes = false,
		-- Turn on / off any sign column related rendering
		sign = true,
		-- Replaces '#+' of 'atx_h._marker'
		-- The number of '#' in the heading determines the 'level'
		-- The 'level' is used to index into the list using a cycle
		-- If the value is a function the input context contains the nesting level of the heading within sections
		icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
		-- Determines how icons fill the available space:
		--  right:   '#'s are concealed and icon is appended to right side
		--  inline:  '#'s are concealed and icon is inlined on left side
		--  overlay: icon is left padded with spaces and inserted on left hiding any additional '#'
		position = 'overlay',
		-- Added to the sign column if enabled
		-- The 'level' is used to index into the list using a cycle
		signs = { '󰫎 ' },
		-- Width of the heading background:
		--  block: width of the heading text
		--  full:  full width of the window
		-- Can also be a list of the above values in which case the 'level' is used
		-- to index into the list using a clamp
		width = 'full',
		-- Amount of margin to add to the left of headings
		-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
		-- Margin available space is computed after accounting for padding
		-- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
		left_margin = 0,
		-- Amount of padding to add to the left of headings
		-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
		-- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
		left_pad = 0,
		-- Amount of padding to add to the right of headings when width is 'block'
		-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
		-- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
		right_pad = 0,
		-- Minimum width to use for headings when width is 'block'
		-- Can also be a list of integers in which case the 'level' is used to index into the list using a clamp
		min_width = 0,
		-- Determines if a border is added above and below headings
		-- Can also be a list of booleans in which case the 'level' is used to index into the list using a clamp
		border = false,
		-- Always use virtual lines for heading borders instead of attempting to use empty lines
		border_virtual = false,
		-- Highlight the start of the border using the foreground highlight
		border_prefix = false,
		-- Used above heading for border
		above = '▄',
		-- Used below heading for border
		below = '▀',
		-- The 'level' is used to index into the list using a clamp
		-- Highlight for the heading icon and extends through the entire line
		backgrounds = {
			'RenderMarkdownH1Bg',
			'RenderMarkdownH2Bg',
			'RenderMarkdownH3Bg',
			'RenderMarkdownH4Bg',
			'RenderMarkdownH5Bg',
			'RenderMarkdownH6Bg',
		},
		-- The 'level' is used to index into the list using a clamp
		-- Highlight for the heading and sign icons
		foregrounds = {
			'RenderMarkdownH1',
			'RenderMarkdownH2',
			'RenderMarkdownH3',
			'RenderMarkdownH4',
			'RenderMarkdownH5',
			'RenderMarkdownH6',
		},
		-- Define custom heading patterns which allow you to override various properties
		-- based on the contents of a heading. Each entry should consist of a string key,
		-- which is used mostly as an identifier, and a table value with:
		--   'pattern':    Matched against the heading text see :h lua-pattern
		--   'icon':       Optional override for the icon
		--   'background': Optional override for the background
		--   'foreground': Optional override for the foreground
		custom = {},
	},
	paragraph = {
		-- Turn on / off paragraph rendering
		enabled = true,
		-- Additional modes to render paragraphs
		render_modes = false,
		-- Amount of margin to add to the left of paragraphs
		-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
		left_margin = 0,
		-- Minimum width to use for paragraphs
		min_width = 0,
	},
	code = {
		-- Turn on / off code block & inline code rendering
		enabled = true,
		-- Additional modes to render code blocks
		render_modes = false,
		-- Turn on / off any sign column related rendering
		sign = true,
		-- Determines how code blocks & inline code are rendered:
		--  none:     disables all rendering
		--  normal:   adds highlight group to code blocks & inline code, adds padding to code blocks
		--  language: adds language icon to sign column if enabled and icon + name above code blocks
		--  full:     normal + language
		style = 'full',
		-- Determines where language icon is rendered:
		--  right: right side of code block
		--  left:  left side of code block
		position = 'left',
		-- Amount of padding to add around the language
		-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
		language_pad = 0,
		-- Whether to include the language name next to the icon
		language_name = true,
		-- A list of language names for which background highlighting will be disabled
		-- Likely because that language has background highlights itself
		-- Or a boolean to make behavior apply to all languages
		-- Borders above & below blocks will continue to be rendered
		disable_background = { 'diff' },
		-- Width of the code block background:
		--  block: width of the code block
		--  full:  full width of the window
		width = 'full',
		-- Amount of margin to add to the left of code blocks
		-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
		-- Margin available space is computed after accounting for padding
		left_margin = 0,
		-- Amount of padding to add to the left of code blocks
		-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
		left_pad = 0,
		-- Amount of padding to add to the right of code blocks when width is 'block'
		-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
		right_pad = 0,
		-- Minimum width to use for code blocks when width is 'block'
		min_width = 0,
		-- Determines how the top / bottom of code block are rendered:
		--  none:  do not render a border
		--  thick: use the same highlight as the code body
		--  thin:  when lines are empty overlay the above & below icons
		border = 'thin',
		-- Used above code blocks for thin border
		above = '▄',
		-- Used below code blocks for thin border
		below = '▀',
		-- Highlight for code blocks
		highlight = 'RenderMarkdownCode',
		-- Highlight for language, overrides icon provider value
		highlight_language = nil,
		-- Padding to add to the left & right of inline code
		inline_pad = 0,
		-- Highlight for inline code
		highlight_inline = 'RenderMarkdownCodeInline',
	},
	dash = {
		-- Turn on / off thematic break rendering
		enabled = true,
		-- Additional modes to render dash
		render_modes = false,
		-- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
		-- The icon gets repeated across the window's width
		icon = '─',
		-- Width of the generated line:
		--  <number>: a hard coded width value, if a floating point value < 1 is provided it is
		--            treated as a percentage of the available window space
		--  full:     full width of the window
		width = 'full',
		-- Amount of margin to add to the left of dash
		-- If a floating point value < 1 is provided it is treated as a percentage of the available window space
		left_margin = 0,
		-- Highlight for the whole line generated from the icon
		highlight = 'RenderMarkdownDash',
	},
	bullet = {
		-- Turn on / off list bullet rendering
		enabled = true,
		-- Additional modes to render list bullets
		render_modes = false,
		-- Replaces '-'|'+'|'*' of 'list_item'
		-- How deeply nested the list is determines the 'level', how far down at that level determines the 'index'
		-- If a function is provided both of these values are provided in the context using 1 based indexing
		-- If a list is provided we index into it using a cycle based on the level
		-- If the value at that level is also a list we further index into it using a clamp based on the index
		-- If the item is a 'checkbox' a conceal is used to hide the bullet instead
		icons = { '●', '○', '◆', '◇' },
		-- Replaces 'n.'|'n)' of 'list_item'
		-- How deeply nested the list is determines the 'level', how far down at that level determines the 'index'
		-- If a function is provided both of these values are provided in the context using 1 based indexing
		-- If a list is provided we index into it using a cycle based on the level
		-- If the value at that level is also a list we further index into it using a clamp based on the index
		ordered_icons = function(ctx)
			local value = vim.trim(ctx.value)
			local index = tonumber(value:sub(1, #value - 1))
			return string.format('%d.', index > 1 and index or ctx.index)
		end,
		-- Padding to add to the left of bullet point
		left_pad = 0,
		-- Padding to add to the right of bullet point
		right_pad = 0,
		-- Highlight for the bullet icon
		highlight = 'RenderMarkdownBullet',
	},
	-- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'
	-- There are two special states for unchecked & checked defined in the markdown grammar
	checkbox = {
		-- Turn on / off checkbox state rendering
		enabled = true,
		-- Additional modes to render checkboxes
		render_modes = false,
		-- Determines how icons fill the available space:
		--  inline:  underlying text is concealed resulting in a left aligned icon
		--  overlay: result is left padded with spaces to hide any additional text
		position = 'inline',
		unchecked = {
			-- Replaces '[ ]' of 'task_list_marker_unchecked'
			icon = '󰄱 ',
			-- Highlight for the unchecked icon
			highlight = 'RenderMarkdownUnchecked',
			-- Highlight for item associated with unchecked checkbox
			scope_highlight = nil,
		},
		checked = {
			-- Replaces '[x]' of 'task_list_marker_checked'
			icon = '󰱒 ',
			-- Highlight for the checked icon
			highlight = 'RenderMarkdownChecked',
			-- Highlight for item associated with checked checkbox
			scope_highlight = nil,
		},
		-- Define custom checkbox states, more involved as they are not part of the markdown grammar
		-- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
		-- Can specify as many additional states as you like following the 'todo' pattern below
		--   The key in this case 'todo' is for healthcheck and to allow users to change its values
		--   'raw':             Matched against the raw text of a 'shortcut_link'
		--   'rendered':        Replaces the 'raw' value when rendering
		--   'highlight':       Highlight for the 'rendered' icon
		--   'scope_highlight': Highlight for item associated with custom checkbox
		custom = {
			todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
		},
	},
	quote = {
		-- Turn on / off block quote & callout rendering
		enabled = true,
		-- Additional modes to render quotes
		render_modes = false,
		-- Replaces '>' of 'block_quote'
		icon = '▋',
		-- Whether to repeat icon on wrapped lines. Requires neovim >= 0.10. This will obscure text if
		-- not configured correctly with :h 'showbreak', :h 'breakindent' and :h 'breakindentopt'. A
		-- combination of these that is likely to work is showbreak = '  ' (2 spaces), breakindent = true,
		-- breakindentopt = '' (empty string). These values are not validated by this plugin. If you want
		-- to avoid adding these to your main configuration then set them in win_options for this plugin.
		repeat_linebreak = false,
		-- Highlight for the quote icon
		highlight = 'RenderMarkdownQuote',
	},
	pipe_table = {
		-- Turn on / off pipe table rendering
		enabled = true,
		-- Additional modes to render pipe tables
		render_modes = false,
		-- Pre configured settings largely for setting table border easier
		--  heavy:  use thicker border characters
		--  double: use double line border characters
		--  round:  use round border corners
		--  none:   does nothing
		preset = 'none',
		-- Determines how the table as a whole is rendered:
		--  none:   disables all rendering
		--  normal: applies the 'cell' style rendering to each row of the table
		--  full:   normal + a top & bottom line that fill out the table when lengths match
		style = 'full',
		-- Determines how individual cells of a table are rendered:
		--  overlay: writes completely over the table, removing conceal behavior and highlights
		--  raw:     replaces only the '|' characters in each row, leaving the cells unmodified
		--  padded:  raw + cells are padded to maximum visual width for each column
		--  trimmed: padded except empty space is subtracted from visual width calculation
		cell = 'padded',
		-- Amount of space to put between cell contents and border
		padding = 1,
		-- Minimum column width to use for padded or trimmed cell
		min_width = 0,
		-- Characters used to replace table border
		-- Correspond to top(3), delimiter(3), bottom(3), vertical, & horizontal
		-- stylua: ignore
		border = {
			'┌', '┬', '┐',
			'├', '┼', '┤',
			'└', '┴', '┘',
			'│', '─',
		},
		-- Gets placed in delimiter row for each column, position is based on alignment
		alignment_indicator = '━',
		-- Highlight for table heading, delimiter, and the line above
		head = 'RenderMarkdownTableHead',
		-- Highlight for everything else, main table rows and the line below
		row = 'RenderMarkdownTableRow',
		-- Highlight for inline padding used to add back concealed space
		filler = 'RenderMarkdownTableFill',
	},
	-- Callouts are a special instance of a 'block_quote' that start with a 'shortcut_link'
	-- Can specify as many additional values as you like following the pattern from any below, such as 'note'
	--   The key in this case 'note' is for healthcheck and to allow users to change its values
	--   'raw':        Matched against the raw text of a 'shortcut_link', case insensitive
	--   'rendered':   Replaces the 'raw' value when rendering
	--   'highlight':  Highlight for the 'rendered' text and quote markers
	--   'quote_icon': Optional override for quote.icon value for individual callout
	callout = {
		note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
		tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
		important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
		warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
		caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
		-- Obsidian: https://help.obsidian.md/Editing+and+formatting/Callouts
		abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'RenderMarkdownInfo' },
		summary = { raw = '[!SUMMARY]', rendered = '󰨸 Summary', highlight = 'RenderMarkdownInfo' },
		tldr = { raw = '[!TLDR]', rendered = '󰨸 Tldr', highlight = 'RenderMarkdownInfo' },
		info = { raw = '[!INFO]', rendered = '󰋽 Info', highlight = 'RenderMarkdownInfo' },
		todo = { raw = '[!TODO]', rendered = '󰗡 Todo', highlight = 'RenderMarkdownInfo' },
		hint = { raw = '[!HINT]', rendered = '󰌶 Hint', highlight = 'RenderMarkdownSuccess' },
		success = { raw = '[!SUCCESS]', rendered = '󰄬 Success', highlight = 'RenderMarkdownSuccess' },
		check = { raw = '[!CHECK]', rendered = '󰄬 Check', highlight = 'RenderMarkdownSuccess' },
		done = { raw = '[!DONE]', rendered = '󰄬 Done', highlight = 'RenderMarkdownSuccess' },
		question = { raw = '[!QUESTION]', rendered = '󰘥 Question', highlight = 'RenderMarkdownWarn' },
		help = { raw = '[!HELP]', rendered = '󰘥 Help', highlight = 'RenderMarkdownWarn' },
		faq = { raw = '[!FAQ]', rendered = '󰘥 Faq', highlight = 'RenderMarkdownWarn' },
		attention = { raw = '[!ATTENTION]', rendered = '󰀪 Attention', highlight = 'RenderMarkdownWarn' },
		failure = { raw = '[!FAILURE]', rendered = '󰅖 Failure', highlight = 'RenderMarkdownError' },
		fail = { raw = '[!FAIL]', rendered = '󰅖 Fail', highlight = 'RenderMarkdownError' },
		missing = { raw = '[!MISSING]', rendered = '󰅖 Missing', highlight = 'RenderMarkdownError' },
		danger = { raw = '[!DANGER]', rendered = '󱐌 Danger', highlight = 'RenderMarkdownError' },
		error = { raw = '[!ERROR]', rendered = '󱐌 Error', highlight = 'RenderMarkdownError' },
		bug = { raw = '[!BUG]', rendered = '󰨰 Bug', highlight = 'RenderMarkdownError' },
		example = { raw = '[!EXAMPLE]', rendered = '󰉹 Example', highlight = 'RenderMarkdownHint' },
		quote = { raw = '[!QUOTE]', rendered = '󱆨 Quote', highlight = 'RenderMarkdownQuote' },
		cite = { raw = '[!CITE]', rendered = '󱆨 Cite', highlight = 'RenderMarkdownQuote' },
	},
	link = {
		-- Turn on / off inline link icon rendering
		enabled = true,
		-- Additional modes to render links
		render_modes = false,
		-- How to handle footnote links, start with a '^'
		footnote = {
			-- Replace value with superscript equivalent
			superscript = true,
			-- Added before link content when converting to superscript
			prefix = '',
			-- Added after link content when converting to superscript
			suffix = '',
		},
		-- Inlined with 'image' elements
		image = '󰥶 ',
		-- Inlined with 'email_autolink' elements
		email = '󰀓 ',
		-- Fallback icon for 'inline_link' and 'uri_autolink' elements
		hyperlink = '󰌹 ',
		-- Applies to the inlined icon as a fallback
		highlight = 'RenderMarkdownLink',
		-- Applies to WikiLink elements
		wiki = { icon = '󱗖 ', highlight = 'RenderMarkdownWikiLink' },
		-- Define custom destination patterns so icons can quickly inform you of what a link
		-- contains. Applies to 'inline_link', 'uri_autolink', and wikilink nodes. When multiple
		-- patterns match a link the one with the longer pattern is used.
		-- Can specify as many additional values as you like following the 'web' pattern below
		--   The key in this case 'web' is for healthcheck and to allow users to change its values
		--   'pattern':   Matched against the destination text see :h lua-pattern
		--   'icon':      Gets inlined before the link text
		--   'highlight': Optional highlight for the 'icon', uses fallback highlight if not provided
		custom = {
			web = { pattern = '^http', icon = '󰖟 ' },
			discord = { pattern = 'discord%.com', icon = '󰙯 ' },
			github = { pattern = 'github%.com', icon = '󰊤 ' },
			gitlab = { pattern = 'gitlab%.com', icon = '󰮠 ' },
			google = { pattern = 'google%.com', icon = '󰊭 ' },
			neovim = { pattern = 'neovim%.io', icon = ' ' },
			reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
			stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
			wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
			youtube = { pattern = 'youtube%.com', icon = '󰗃 ' },
		},
	},
	sign = {
		-- Turn on / off sign rendering
		enabled = true,
		-- Applies to background of sign text
		highlight = 'RenderMarkdownSign',
	},
	-- Mimics Obsidian inline highlights when content is surrounded by double equals
	-- The equals on both ends are concealed and the inner content is highlighted
	inline_highlight = {
		-- Turn on / off inline highlight rendering
		enabled = true,
		-- Additional modes to render inline highlights
		render_modes = false,
		-- Applies to background of surrounded text
		highlight = 'RenderMarkdownInlineHighlight',
	},
	-- Mimic org-indent-mode behavior by indenting everything under a heading based on the
	-- level of the heading. Indenting starts from level 2 headings onward.
	indent = {
		-- Turn on / off org-indent-mode
		enabled = false,
		-- Additional modes to render indents
		render_modes = false,
		-- Amount of additional padding added for each heading level
		per_level = 2,
		-- Heading levels <= this value will not be indented
		-- Use 0 to begin indenting from the very first level
		skip_level = 1,
		-- Do not indent heading titles, only the body
		skip_heading = false,
	},
	html = {
		-- Turn on / off all HTML rendering
		enabled = true,
		-- Additional modes to render HTML
		render_modes = false,
		comment = {
			-- Turn on / off HTML comment concealing
			conceal = true,
			-- Optional text to inline before the concealed comment
			text = nil,
			-- Highlight for the inlined text
			highlight = 'RenderMarkdownHtmlComment',
		},
	},
	-- Window options to use that change between rendered and raw view
	win_options = {
		-- See :h 'conceallevel'
		conceallevel = {
			-- Used when not being rendered, get user setting
			default = vim.api.nvim_get_option_value('conceallevel', {}),
			-- Used when being rendered, concealed text is completely hidden
			rendered = 3,
		},
		-- See :h 'concealcursor'
		concealcursor = {
			-- Used when not being rendered, get user setting
			default = vim.api.nvim_get_option_value('concealcursor', {}),
			-- Used when being rendered, disable concealing text in all modes
			rendered = '',
		},
	},
	-- More granular configuration mechanism, allows different aspects of buffers
	-- to have their own behavior. Values default to the top level configuration
	-- if no override is provided. Supports the following fields:
	--   enabled, max_file_size, debounce, render_modes, anti_conceal, padding,
	--   heading, paragraph, code, dash, bullet, checkbox, quote, pipe_table,
	--   callout, link, sign, indent, latex, html, win_options
	overrides = {
		-- Override for different buflisted values, see :h 'buflisted'
		buflisted = {},
		-- Override for different buftype values, see :h 'buftype'
		buftype = {
			nofile = {
				render_modes = true,
				padding = { highlight = 'NormalFloat' },
				sign = { enabled = false },
			},
		},
		-- Override for different filetype values, see :h 'filetype'
		filetype = {},
	},
	-- Mapping from treesitter language to user defined handlers
	-- See 'Custom Handlers' document for more info
	custom_handlers = {},
})
