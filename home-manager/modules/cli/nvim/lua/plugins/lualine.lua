require('lualine').setup({
	options = {
		theme = 'auto', -- <- this will follow whatever :colorscheme is active
		component_separators = '',
		section_separators = { left = '', right = '' },
		globalstatus = true,
	},
	sections = {
		lualine_a = { { 'mode', separator = { left = '' } } },
		lualine_b = { 'branch', 'filetype' },
		lualine_c = { 'filename' },
		lualine_x = { 'diff', 'diagnostics' },
		lualine_y = { 'progress' },
		lualine_z = { { 'location', separator = { right = '' } } },
	},
})
