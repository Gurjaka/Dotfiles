require('nvim-tree').setup({
	auto_reload_on_write = true,
	sort = { sorter = 'case_sensitive' },
	view = {
		-- width = 30,
		side = 'left'
	},
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        folder_arrow = false,
      },
    },
  },
	filters = { dotfiles = false }
})
vim.keymap.set('n', '<leader>t', ':NvimTreeFocus<CR>', { desc = 'Toggle file tree' })
