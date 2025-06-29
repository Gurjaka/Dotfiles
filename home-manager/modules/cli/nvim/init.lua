local config_path = vim.fn.stdpath("config")
-- Expand Lua's search path so it finds Home Manager-symlinked modules
package.path = package.path .. ";/home/gurami/.config/nvim/lua/?.lua;/home/gurami/.config/nvim/lua/?/init.lua"

-- Core
require('core.options')
require('core.autocmds')
require('core.keymaps')

-- Plugins
require('plugins.alpha')
require('plugins.cmp')
require('plugins.conform')
require('plugins.indent-blankline')
require('plugins.lsp')
require('plugins.lualine')
require('plugins.noice')
require('plugins.notify')
require('plugins.nvim-surround')
require('plugins.nvim-tree')
require('plugins.render-markdown')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.web-devicons')
