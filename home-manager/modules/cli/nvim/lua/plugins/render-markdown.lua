require('render-markdown').setup({
	enabled = true,
  render_modes = { 'n', 'v' },
	max_file_size = 10.0,
  heading = {
    icons = { '󰲡', '󰲣', '󰲥', '󰲧', '󰲩', '󰲫' },
    signs = { '󰫎' },
    padding = 1,
  },
  code = {
    style = 'bordered', -- or 'none' if you prefer keeping native colors
    border = 'rounded',
  },
	checkbox = {
		unchecked = { icon = '󰄱 ' },
		checked = { icon = '󰱒 ' }
	}
})
