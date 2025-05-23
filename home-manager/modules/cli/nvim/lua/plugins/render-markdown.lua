require('render-markdown').setup({
	enabled = true,
	render_modes = { 'n', 'c', 't' },
	max_file_size = 10.0,
	heading = {
		icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
		signs = { '󰫎 ' }
	},
	code = { style = 'full' },
	checkbox = {
		unchecked = { icon = '󰄱 ' },
		checked = { icon = '󰱒 ' }
	}
})
