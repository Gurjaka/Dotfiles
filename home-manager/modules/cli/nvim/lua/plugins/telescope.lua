local builtin = require('telescope.builtin')

require('telescope').setup({
  defaults = {
    -- layout_strategy = 'flex',
    layout_config = { prompt_position = 'top', preview_width = 0.6 },
    sorting_strategy = 'ascending',
    prompt_prefix = '   ',
    selection_caret = '  ',
    file_ignore_patterns = { 'node_modules', '.git/' },
  },
})

vim.keymap.set('n', '<leader>ff', function()
  local ok = pcall(builtin.git_files, { show_untracked = true })
  if not ok then
    builtin.find_files({ hidden = true})
  end
end, { desc = 'Find files (no preview)' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
