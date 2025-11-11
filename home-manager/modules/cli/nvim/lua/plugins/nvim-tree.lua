require('nvim-tree').setup({
	auto_reload_on_write = true,
	sort = { sorter = 'case_sensitive' },
	view = {
		side = 'left'
	},
  renderer = {
    add_trailing = false,
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "name",
    root_folder_modifier = ":t",
    icons = {
      webdev_colors = true,
      git_placement = "after",
      show = {
        folder_arrow = true,
        file = true,
        folder = true,
        git = true,
      },
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    indent_markers = {
      enable = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
  },
	filters = { dotfiles = false }
})
