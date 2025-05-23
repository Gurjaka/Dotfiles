local colors = {
	blue = '#81a1c1',
	frost_green = '#8fbcbb',
	black = '#2e3440',
	white = '#eceff4',
	red = '#bf616a',
	violet = '#b48ead',
	grey = '#3b4252',
}

require('lualine').setup({
	options = {
		theme = {
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
		},
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
