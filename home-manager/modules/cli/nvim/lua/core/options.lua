-- General
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.list = true
vim.o.listchars = "tab:→ ,trail:·,extends:↷,precedes:↶"

-- Editor
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.clipboard = "unnamedplus"
vim.o.swapfile = false
vim.o.autoread = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

-- Performance
vim.loader.enable()
vim.g.do_filetype_lua = 1
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- UI
vim.g.nord_contrast = false
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_enable_sidebar_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true
